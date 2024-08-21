import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/pagination/cubit/pagination_cubit.dart';
import '../../../../../core/pagination/widget/pagination_widget.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/extension.dart';
import '../../../../../core/utils/svg_manager.dart';
import '../../../../../core/utils/validator.dart';
import '../../../../../core/utils/values/assets.dart';
import '../../../../../core/utils/values/strings.dart';
import '../../../../../core/utils/values/text_styles.dart';
import '../../../../../core/widgets/app_elevated_button.dart';
import '../../../../../core/widgets/app_image.dart';
import '../../../../../core/widgets/app_shimmer.dart';
import '../../../../../core/widgets/app_snack_bar.dart';
import '../../../../../core/widgets/loading_view.dart';
import '../../../../../core/widgets/menu_text_form_field.dart';
import '../../../../../core/widgets/show_modal_bottom_sheet.dart';
import '../../../../../core/widgets/text_form_field.dart';
import '../../../../../injection_container.dart';
import '../../../../portal/domain/entities/get_cities_response.dart';
import '../../../../portal/domain/entities/get_doctor_titles_response.dart';
import '../../../../portal/domain/entities/get_governments_response.dart';
import '../../../../portal/domain/entities/get_specialities_response.dart';
import '../../../../portal/domain/usecases/get_governments_usecase.dart';
import '../../../../portal/domain/usecases/get_specialities_usecase.dart';
import '../../../../portal/presentation/controller/get_cities/get_cities_cubit.dart';
import '../../../../portal/presentation/controller/get_doctor_titles/get_doctor_titles_cubit.dart';
import '../../../../portal/presentation/controller/get_governments/get_governments_cubit.dart';
import '../../../../portal/presentation/controller/get_specialities/get_specialities_cubit.dart';
import '../../../../profile/domain/entities/get_profile_response.dart';
import '../../../../profile/presentation/cubit/get_profile/get_profile_cubit.dart';
import '../../cubit/update_register/update_register_cubit.dart';
import '../../widgets/select_gender.dart';

class UpdateRegisterScreen extends StatefulWidget {
  const UpdateRegisterScreen({super.key});

  @override
  State<UpdateRegisterScreen> createState() => _UpdateRegisterScreenState();
}

class _UpdateRegisterScreenState extends State<UpdateRegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController firstNameTextController = TextEditingController();
  // final TextEditingController middleAndLastNameTextController = TextEditingController();
  final TextEditingController nationalIDTextController =
      TextEditingController();
  final TextEditingController addressTextController = TextEditingController();
  final TextEditingController dateOfBirthTextController =
      TextEditingController();
  final TextEditingController specialityTextController =
      TextEditingController();
  final TextEditingController subSpecialityTextController =
      TextEditingController();
  final TextEditingController doctorTitleTextController =
      TextEditingController();

  final FocusNode firstNameFocus = FocusNode();
  // final FocusNode middleAndLastNameFocus = FocusNode();
  final FocusNode nationalIDFocus = FocusNode();
  final FocusNode addressFocus = FocusNode();
  final FocusNode dateOfBirthFocus = FocusNode();
  final FocusNode specialityFocus = FocusNode();
  final FocusNode subSpecialityFocus = FocusNode();
  final FocusNode doctorTitleFocus = FocusNode();

  int currentStep = 1;
  String gender = 'male';
  String dateStr = '';
  Speciality? speciality;
  Speciality? subSpeciality;
  DoctorTitle? doctorTitle;
  String? doctorPhotoUrl;
  Government? selectedGovernment;
  City? selectedCity;

  @override
  void initState() {
    super.initState();
    context.read<GetGovernmentsCubit>().fPagination();
    context.read<GetDoctorTitlesCubit>().fPagination();
    final User? user = context.read<GetProfileCubit>().user;
    fillUserData(user);
  }

  void fillUserData(User? user) {
    doctorPhotoUrl = user?.doctor.photo;
    firstNameTextController.text = user?.firstname ?? '';
    // middleAndLastNameTextController.text = user?.lastname?? '';
    nationalIDTextController.text = user?.doctor.nationalNumber ?? '';
    selectedCity = City(
      id: user?.city?.id ?? 0,
      governmentId: user?.city?.governmentId ?? 0,
      name: user?.city?.name ?? '',
      lat: user?.city?.lat,
      lon: user?.city?.lon,
    );
    addressTextController.text = user?.city?.name ?? '';
    gender = user?.gender ?? 'male';
    dateStr = user?.doctor.dob ?? '';
    dateOfBirthTextController.text = dateStr;
    if (user != null && user.doctor.specialities.isNotEmpty) {
      if (user.doctor.specialities.length == 1) {
        speciality = user.doctor.specialities.first;
        specialityTextController.text = speciality!.title;
      } else {
        for (Speciality item in user.doctor.specialities) {
          if (item.children.isNotEmpty) {
            speciality = item;
            specialityTextController.text = speciality!.title;
          } else {
            subSpeciality = item;
            subSpecialityTextController.text = subSpeciality!.title;
          }
        }
      }
      // speciality = user.doctor.specialities.first;
      // specialityTextController.text = speciality!.title;
      // if (user.doctor.specialities.length > 1) {
      //   subSpeciality = user.doctor.specialities[1];
      //   subSpecialityTextController.text = subSpeciality?.title ?? '';
      // }
    }
  }

  ColorFilter iconColor(FocusNode focusNode) {
    return ColorFilter.mode(
      focusNode.hasFocus ? colors.main : colors.body,
      BlendMode.srcIn,
    );
  }

  openCalender() {
    DateTime initDate = DateTime.now();
    if (dateStr.isNotEmpty) {
      initDate = DateTime.tryParse(dateStr) ?? DateTime.now();
    }
    return showDatePicker(
      context: context,
      initialDate: initDate,
      firstDate: DateTime(1940),
      lastDate: DateTime.now(),
    ).then((date) {
      setState(() {
        if (date != null) {
          dateStr = date.displayDate;
          dateOfBirthTextController.text = date.displayDateNamed;
        }
      });
    });
  }

  unFocus() {
    firstNameFocus.unfocus();
    // middleAndLastNameFocus.unfocus();
    nationalIDFocus.unfocus();
    addressFocus.unfocus();
    dateOfBirthFocus.unfocus();
    specialityFocus.unfocus();
    subSpecialityFocus.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (value) async {
        context.read<UpdateRegisterCubit>().resetFields();
        value = true;
      },
      child: GestureDetector(
        onTap: () => unFocus(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: colors.upBackGround,
            title: Text(
              Strings.editMyData,
            ),
          ),
          backgroundColor: colors.upBackGround,
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 24.h),

                  Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (currentStep != 1) {
                                  setState(() {
                                    currentStep = 1;
                                  });
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(
                                    currentStep == 1 ? 12.r : 8.r),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        currentStep == 1 ? null : colors.main,
                                    border: Border.all(
                                      width: 1.0,
                                      color: colors.main,
                                    )),
                                child: currentStep == 1
                                    ? Text(
                                        '1',
                                        style: TextStyles.regular12(
                                            color: colors.main),
                                      )
                                    : Icon(
                                        Icons.check_rounded,
                                        color: colors.baseColor,
                                        size: 16.r,
                                      ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 1,
                                color: currentStep == 1
                                    ? colors.body.withOpacity(0.15)
                                    : colors.main,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(12.r),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 1.0,
                                    color: currentStep == 1
                                        ? colors.body.withOpacity(0.15)
                                        : colors.main,
                                  )),
                              child: Text(
                                '2',
                                style: TextStyles.regular12(
                                    color: currentStep == 1
                                        ? colors.body
                                        : colors.main),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.85,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Strings.personalInformation,
                              style: TextStyles.regular12(color: colors.main),
                            ),
                            Expanded(
                              child: Container(
                                height: 1,
                                color: Colors.transparent,
                              ),
                            ),
                            Text(
                              Strings.professionalInformation,
                              style: TextStyles.regular12(
                                  color: currentStep == 1
                                      ? colors.body
                                      : colors.main),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 24.h),

                  currentStep == 1
                      ? buildBodyOfFirstStep()
                      : buildBodyOfSecondStep(context),

                  SizedBox(height: 32.h),
                  BlocConsumer<UpdateRegisterCubit, UpdateRegisterState>(
                    listener: (context, state) {
                      if (state is UpdateRegisterSuccessState) {
                        showAppSnackBar(
                            context: context,
                            message: state.message ?? '',
                            type: ToastType.success);
                        context.read<UpdateRegisterCubit>().resetFields();
                        context.read<GetProfileCubit>().fGetProfile();
                        Navigator.pop(context);
                      }
                      if (state is UpdateRegisterErrorState) {
                        if (state.isUpdateRegisterApprovedUserFailure) {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          context.read<GetProfileCubit>().fGetProfile();
                          return;
                        }
                        showAppSnackBar(
                            context: context,
                            message: state.message,
                            type: ToastType.error);
                      }
                    },
                    builder: (context, state) {
                      return Column(
                        children: [
                          (state is UpdateRegisterLoadingState)
                              ? const LoadingView()
                              : AppElevatedButton(
                                  text: Strings.continueStr,
                                  onPressed: () => onUpdateRegisterPressed(),
                                ),
                          (state is UpdateRegisterErrorState)
                              ? const SizedBox(height: 8.0)
                              : const SizedBox(),
                          (state is UpdateRegisterErrorState)
                              ? SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    state.message,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(color: Colors.red),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 32.h),
                  // const AcceptTermsWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBodyOfFirstStep() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
              if (value != null) {
                final imageFile = File(value.path);
                context.read<UpdateRegisterCubit>().setDoctorPhoto(imageFile);
              }
            });
          },
          child: BlocBuilder<UpdateRegisterCubit, UpdateRegisterState>(
              builder: (context, state) {
            return Stack(
              children: [
                Builder(builder: (context) {
                  if (context.read<UpdateRegisterCubit>().doctorPhoto != null) {
                    return AppImage.file(
                      width: 80.w,
                      height: 80.h,
                      imageFile:
                          context.read<UpdateRegisterCubit>().doctorPhoto!,
                      isCircle: true,
                      fit: BoxFit.scaleDown,
                    );
                  }
                  return AppImage.network(
                    width: 80.w,
                    height: 80.h,
                    imageUrl:
                        context.read<GetProfileCubit>().user?.doctor.photo,
                    isCircle: true,
                    fit: BoxFit.scaleDown,
                  );
                }),
                PositionedDirectional(
                  bottom: 0,
                  end: 0,
                  child: Container(
                    padding: EdgeInsets.all(4.r),
                    decoration: BoxDecoration(
                      color: colors.main,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      Assets.iconsCameraPlus,
                      width: 20.w,
                      height: 20.h,
                      colorFilter: ColorFilter.mode(
                        colors.baseColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
        SizedBox(height: 24.h),
        // Row(
        //   children: [
        //     Expanded(
        //       child: AppTextFormField(
        //         controller: firstNameTextController,
        //         focusNode: firstNameFocus,
        //         textInputAction: TextInputAction.next,
        //         validatorType: ValidatorType.standard,
        //         prefixIcon: Padding(
        //           padding:
        //           EdgeInsets.symmetric(horizontal: 12.0.w),
        //           child: SvgPicture.asset(
        //             SvgAssets.user,
        //             colorFilter: iconColor(firstNameFocus),
        //           ),
        //         ),
        //         labelText: Strings.firstName,
        //         hintText: Strings.firstName,
        //         onSaved: (value) {},
        //       ),
        //     ),
        //     SizedBox(width: 8.w),
        //     Expanded(
        //       child: AppTextFormField(
        //         controller: middleAndLastNameTextController,
        //         focusNode: middleAndLastNameFocus,
        //         textInputAction: TextInputAction.next,
        //         validatorType: ValidatorType.name,
        //         prefixIcon: Padding(
        //           padding:
        //           EdgeInsets.symmetric(horizontal: 12.0.w),
        //           child: SvgPicture.asset(
        //             SvgAssets.user,
        //             colorFilter: iconColor(middleAndLastNameFocus),
        //           ),
        //         ),
        //         labelText: Strings.lastName,
        //         hintText: Strings.lastName,
        //         onSaved: (value) {},
        //       ),
        //     ),
        //   ],
        // ),
        /// doctor name
        AppTextFormField(
          controller: firstNameTextController,
          focusNode: firstNameFocus,
          textInputAction: TextInputAction.next,
          validatorType: ValidatorType.standard,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0.w),
            child: SvgPicture.asset(
              SvgAssets.user,
              colorFilter: iconColor(firstNameFocus),
            ),
          ),
          labelText: Strings.doctorName,
          hintText: '${Strings.example}: محمد أحمد على',
        ),
        SizedBox(height: 16.h),

        /// national number
        AppTextFormField(
          controller: nationalIDTextController,
          focusNode: nationalIDFocus,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          // validatorType: ValidatorType.numbersOnly,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0.w),
            child: SvgPicture.asset(
              Assets.iconsNationalId,
              colorFilter: iconColor(nationalIDFocus),
            ),
          ),
          labelText: Strings.nationalID,
          hintText: Strings.nationalID,
          onSaved: (value) {},
        ),
        SizedBox(height: 4.h),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            Strings.nameNationalIdMismatch,
            style: TextStyles.regular12(color: colors.body),
          ),
        ),
        SizedBox(height: 16.h),

        /// national number images
        InkWell(
          onTap: () {
            ImagePicker().pickMultiImage().then((values) {
              if (values.isNotEmpty) {
                List<File> images = [];
                for (final value in values) {
                  images.add(File(value.path));
                }
                super
                    .context
                    .read<UpdateRegisterCubit>()
                    .setNationalNumberImages(images);
              }
            });
          },
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: colors.main.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: colors.main.withOpacity(0.25),
              ),
            ),
            child: BlocBuilder<UpdateRegisterCubit, UpdateRegisterState>(
              builder: (context, state) {
                final imagesFiles =
                    context.read<UpdateRegisterCubit>().nationalNumberImages;
                if (imagesFiles.isNotEmpty) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.nationalIDImages,
                        style: TextStyles.medium14(),
                      ),
                      SizedBox(height: 8.h),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).width * 0.35,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: imagesFiles.length,
                          itemBuilder: (context, index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: AppImage.file(
                                width: MediaQuery.sizeOf(context).width * 0.4,
                                height: MediaQuery.sizeOf(context).width * 0.35,
                                imageFile: imagesFiles[index],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 4.w),
                        ),
                      ),
                    ],
                  );
                }
                return Column(
                  children: [
                    SvgPicture.asset(Assets.iconsFileUpload),
                    SizedBox(height: 8.h),
                    Text(
                      Strings.pleaseUploadNationalIdImages,
                      style: TextStyles.medium14(color: colors.main),
                    ),
                  ],
                );
              },
            ),
          ),
        ),

        SizedBox(height: 16.h),
        BlocConsumer<GetGovernmentsCubit, PaginationState>(
            listener: (context, state) {
          if (state is PaginationSuccessState && selectedGovernment == null) {
            selectedGovernment = state.value.firstWhere(
              (element) =>
                  element.id ==
                  context.read<GetProfileCubit>().user?.city?.governmentId,
              orElse: () => const Government(
                  id: 0, name: '', countryId: 0, lat: '', lon: '', cities: []),
            );
            if (selectedGovernment?.id == 0) {
              selectedGovernment = null;
            }
            String cityName =
                context.read<GetProfileCubit>().user?.city?.name ?? '';
            addressTextController.text =
                '${selectedGovernment?.name ?? ''}, $cityName';
          }
        }, builder: (context, state) {
          return AppTextFormField(
            controller: addressTextController,
            focusNode: addressFocus,
            textInputAction: TextInputAction.next,
            validatorType: ValidatorType.standard,
            readOnly: true,
            labelText: Strings.address,
            hintText: Strings.address,
            onTap: () =>
                showGovernments(context, sharedPreferences.getCountryId() ?? 1),
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0.w),
              child: SvgPicture.asset(
                Assets.iconsMap,
                colorFilter: iconColor(addressFocus),
              ),
            ),
          );
        }),
        SizedBox(height: 16.h),
        AppTextFormField(
          onTap: () => openCalender(),
          controller: dateOfBirthTextController,
          focusNode: dateOfBirthFocus,
          textInputAction: TextInputAction.next,
          validatorType: ValidatorType.standard,
          readOnly: true,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0.w),
            child: SvgPicture.asset(
              SvgAssets.calendar,
              colorFilter: iconColor(dateOfBirthFocus),
            ),
          ),
          labelText: Strings.dateOfBirth,
          hintText: Strings.dateOfBirth,
          onSaved: (value) {},
        ),
        SizedBox(height: 16.h),
        SelectGender(
          currentGender: gender,
          updateView: (value) {
            gender = value;
          },
        ),
      ],
    );
  }

  Widget buildBodyOfSecondStep(context) {
    return Column(
      children: [
        /// mainSpecialty
        InkWell(
          onTap: () => showSpecialists(context),
          child: MenuTextFormField(
            controller: specialityTextController,
            focusNode: specialityFocus,
            onTap: () => showSpecialists(context),
            validate: (value) =>
                Validator.call(value: value, type: ValidatorType.standard),
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              child: SvgPicture.asset(
                SvgAssets.tool,
                colorFilter: ColorFilter.mode(colors.textColor, BlendMode.srcIn),
              ),
            ),
            labelText: Strings.mainSpecialty,
            hintText: Strings.mainSpecialty,
          ),
        ),
        SizedBox(height: 16.h),

        /// subSpecialty
        InkWell(
          onTap: () => showSubSpecialists(context),
          child: MenuTextFormField(
            controller: subSpecialityTextController,
            focusNode: subSpecialityFocus,
            onTap: () => showSubSpecialists(context),
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              child: SvgPicture.asset(
                SvgAssets.tool,
                colorFilter: ColorFilter.mode(colors.textColor, BlendMode.srcIn),
              ),
            ),
            labelText: Strings.subSpecialty,
            hintText: Strings.subSpecialty,
          ),
        ),
        SizedBox(height: 16.h),

        /// doctorTitles
        BlocBuilder<GetDoctorTitlesCubit, PaginationState>(
            builder: (context, state) {
          if (state is PaginationSuccessState && doctorTitle == null) {
            if (state.value.isNotEmpty) {
              doctorTitle = state.value
                  .where((element) =>
                      element.title ==
                      context.read<GetProfileCubit>().user!.doctor.title)
                  .first;
              doctorTitleTextController.text = doctorTitle?.title ?? '';
            }
          }
          return InkWell(
            onTap: () => showSubSpecialists(context),
            child: MenuTextFormField(
              controller: doctorTitleTextController,
              focusNode: doctorTitleFocus,
              onTap: () => showDoctorTitles(context),
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: SvgPicture.asset(
                  SvgAssets.tool,
                  colorFilter: ColorFilter.mode(colors.textColor, BlendMode.srcIn),
                ),
              ),
              labelText: Strings.title,
              hintText: Strings.title,
            ),
          );
        }),
        SizedBox(height: 24.h),

        /// certificate
        InkWell(
          onTap: () {
            ImagePicker().pickMedia().then((value) {
              if (value != null) {
                final certificateFile = File(value.path);
                super
                    .context
                    .read<UpdateRegisterCubit>()
                    .setCertificatePhoto(certificateFile);
              }
            });
          },
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: colors.main.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: colors.main.withOpacity(0.25),
              ),
            ),
            child: BlocBuilder<UpdateRegisterCubit, UpdateRegisterState>(
              builder: (context, state) {
                // if(state is RegisterLoadingState){
                //   return const Center(
                //     child: CircularProgressIndicator(),
                //   );
                // }
                if (context.read<UpdateRegisterCubit>().certificatePhoto !=
                    null) {
                  return Center(
                    child: Text(
                      Strings.professionalLicenseFileUploaded,
                      style: TextStyles.medium14(color: colors.main),
                    ),
                  );
                }
                return Column(
                  children: [
                    SvgPicture.asset(Assets.iconsFileUpload),
                    SizedBox(height: 8.h),
                    Text(
                      Strings.uploadProfessionalLicense,
                      style: TextStyles.medium14(color: colors.main),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      '${Strings.useImagesOrPdfsUpTo} 50 ${Strings.megaByte}',
                      style: TextStyles.regular12(color: colors.body),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  showSpecialists(context) {
    showAppModalBottomSheet(
      context: context,
      isDismissible: true,
      height: ScreenUtil().screenHeight * 0.9,
      child: PaginationWidget<Speciality, GetSpecialitiesCubit>(
        additionalParams: const GetSpecialitiesParams(
          orderBy: 'title',
          orderDir: 'asc',
          filterParentId: -1,
        ),
        title: Strings.mainSpecialty,
        isSearch: true,
        searchTextController: TextEditingController(),
        hintText: Strings.search,
        itemCardWidget: (Speciality item, int index) {
          return ListTile(
            onTap: () {
              setState(() {
                subSpeciality = null;
                subSpecialityTextController.text = '';
                speciality = item;
                specialityTextController.text = item.title;
              });
              Navigator.pop(context);
            },
            title: Text(
              item.title,
              style: TextStyles.medium16(),
            ),
            leading: Image.network(item.icon),
          );
        },
        itemCardShimmerWidget: AppShimmer(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: baseColorShimmer,
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
            ),
            child: Text(
              'item.title',
              style: TextStyles.medium16(),
            ),
          ),
        ),
      ),
    );
  }

  showSubSpecialists(context) {
    if (speciality != null && speciality!.children.isNotEmpty) {
      showAppModalBottomSheet(
        context: context,
        isDismissible: true,
        height: ScreenUtil().screenHeight * 0.5,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.r),
              child: Center(
                child: Text(
                  Strings.subSpecialty,
                  style: TextStyles.semiBold16(),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 16.h,
                ),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = speciality!.children[index];
                  return ListTile(
                    onTap: () {
                      setState(() {
                        subSpeciality = item;
                        subSpecialityTextController.text = item.title;
                      });
                      Navigator.pop(context);
                    },
                    title: Text(
                      item.title,
                      style: TextStyles.medium16(),
                    ),
                    leading: Image.network(item.icon),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 16.h),
                itemCount: speciality!.children.length,
              ),
            ),
          ],
        ),
      );
    }
  }

  showDoctorTitles(context) {
    showAppModalBottomSheet(
      context: context,
      isDismissible: true,
      height: ScreenUtil().screenHeight * 0.9,
      child: PaginationWidget<DoctorTitle, GetDoctorTitlesCubit>(
        title: Strings.title,
        isSearch: true,
        searchTextController: TextEditingController(),
        hintText: Strings.search,
        itemCardWidget: (DoctorTitle item, int index) {
          return ListTile(
            onTap: () {
              setState(() {
                doctorTitle = item;
                doctorTitleTextController.text = item.title;
              });
              Navigator.pop(context);
            },
            title: Text(
              item.title,
              style: TextStyles.medium16(),
            ),
          );
        },
        itemCardShimmerWidget: AppShimmer(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: baseColorShimmer,
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
            ),
            child: Text(
              'item.title',
              style: TextStyles.medium16(),
            ),
          ),
        ),
      ),
    );
  }

  void showGovernments(context, int countryId) {
    showAppModalBottomSheet(
      context: context,
      isDismissible: true,
      height: MediaQuery.sizeOf(context).height * 0.9,
      child: PaginationWidget<Government, GetGovernmentsCubit>(
        additionalParams: GetGovernmentsParams(countryId: countryId),
        title: Strings.selectAddress,
        isSearch: true,
        searchTextController: TextEditingController(),
        hintText: Strings.search,
        itemCardWidget: (Government item, int index) {
          return ListTile(
            onTap: () {
              Navigator.pop(context);
              setState(() {
                selectedGovernment = item;
              });
              showCities(context, item.cities, item.name);
            },
            title: Text(
              item.name,
              style: TextStyles.medium16(),
            ),
          );
        },
        itemCardShimmerWidget: AppShimmer(
          child: Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: baseColorShimmer,
              borderRadius: BorderRadius.all(Radius.circular(16.r)),
            ),
            child: Text(
              'item.title',
              style: TextStyles.medium16(),
            ),
          ),
        ),
      ),
    );
  }

  void showCities(BuildContext context, List<City> cities, String name) {
    showAppModalBottomSheet(
      context: context,
      isDismissible: true,
      height: MediaQuery.sizeOf(context).height * 0.9,
      child: PaginationWidget<City, GetCitiesCubit>(
        items: cities,
        title: Strings.selectAddress,
        isSearch: true,
        searchTextController: TextEditingController(),
        hintText: Strings.search,
        itemCardWidget: (City item, int index) {
          return ListTile(
            onTap: () {
              setState(() {
                selectedCity = item;
                addressTextController.text = '$name, ${item.name}';
              });
              Navigator.pop(context);
            },
            title: Text(
              item.name,
              style: TextStyles.medium16(),
            ),
          );
        },
        itemCardShimmerWidget: AppShimmer(
          child: Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: baseColorShimmer,
              borderRadius: BorderRadius.all(Radius.circular(16.r)),
            ),
            child: Text(
              'item.title',
              style: TextStyles.medium16(),
            ),
          ),
        ),
      ),
    );
  }

  void updateRegister() {
    context.read<UpdateRegisterCubit>().fUpdateRegister(
          firstName: firstNameTextController.text.trim(),
          // middleAndLastName: middleAndLastNameTextController.text.trim(),
          dob: dateStr,
          gender: gender,
          specialityId: speciality!.id,
          subSpecialityId: subSpeciality?.id,
          titleId: doctorTitle?.id,
          cityId: selectedCity?.id,
          nationalNumber: nationalIDTextController.text.trim(),
        );
  }

  void onUpdateRegisterPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (currentStep == 1) {
        // if(context.read<UpdateRegisterCubit>().nationalNumberImages.isEmpty){
        //   showAppSnackBar(
        //     context: context,
        //     message: Strings.pleaseUploadNationalIdImages,
        //     type: ToastType.warning,
        //   );
        //   return;
        // }
        setState(() {
          currentStep++;
        });
        return;
      }
      if (speciality == null) {
        showAppSnackBar(
          context: context,
          message: Strings.pleaseSelectTheSpeciality,
          type: ToastType.warning,
        );
        return;
      }
      // if(context.read<UpdateRegisterCubit>().certificatePhoto == null){
      //   showAppSnackBar(
      //     context: context,
      //     message: Strings.pleaseUploadProfessionalLicenseDocument,
      //     type: ToastType.warning,
      //   );
      //   return;
      // }
      updateRegister();
    }
  }
}

class BaseSection extends StatelessWidget {
  final Widget child;

  const BaseSection({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: colors.baseColor,
      ),
      child: child,
    );
  }
}
