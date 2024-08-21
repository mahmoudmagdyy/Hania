import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/pagination/widget/pagination_widget.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/extension.dart';
import '../../../../../core/utils/svg_manager.dart';
import '../../../../../core/utils/values/assets.dart';
import '../../../../../core/utils/values/strings.dart';
import '../../../../../core/utils/values/text_styles.dart';
import '../../../../../core/widgets/app_elevated_button.dart';
import '../../../../../core/widgets/app_shimmer.dart';
import '../../../../../core/widgets/app_snack_bar.dart';
import '../../../../../core/widgets/loading_dialog.dart';
import '../../../../../core/widgets/menu_text_form_field.dart';
import '../../../../../core/widgets/show_dialog.dart';
import '../../../../../core/widgets/show_modal_bottom_sheet.dart';
import '../../../../../injection_container.dart';
import '../../../../portal/domain/entities/get_doctor_titles_response.dart';
import '../../../../portal/presentation/controller/add_media/add_media_cubit.dart';
import '../../../../portal/presentation/controller/get_doctor_titles/get_doctor_titles_cubit.dart';
import '../../cubit/get_doctor_title/get_doctor_title_cubit.dart';
import '../../cubit/get_profile/get_profile_cubit.dart';
import '../../cubit/update_doctor_title/update_doctor_title_cubit.dart';

class EditDoctorTitleScreen extends StatefulWidget {
  const EditDoctorTitleScreen({super.key});

  @override
  State<EditDoctorTitleScreen> createState() => _EditDoctorTitleScreenState();
}

class _EditDoctorTitleScreenState extends State<EditDoctorTitleScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController doctorTitleTextController = TextEditingController();
  final FocusNode doctorTitleFocusNode = FocusNode();
  String? originalDoctorTitle;
  DoctorTitle? doctorTitle;

  @override
  void initState() {
    super.initState();
    context.read<UpdateDoctorTitleCubit>().resetFields();
    readLocalData();
    setOriginalData();
  }

  void readLocalData(){
    if(context.read<GetProfileCubit>().user?.doctor.readTitleFromApproval == true){
      final data = context.read<GetDoctorTitleCubit>().data;
      doctorTitleTextController.text = data?.doctorTitle.title ?? '';
      doctorTitle = data?.doctorTitle;
      return;
    }
    if(context.read<GetProfileCubit>().user != null){
      final user = context.read<GetProfileCubit>().user!;
      doctorTitleTextController.text = user.doctor.title;
    }
  }

  void setOriginalData(){
    originalDoctorTitle = doctorTitleTextController.text;
  }

  void checkDataChanged(){
    if(doctorTitleTextController.text.trim() != originalDoctorTitle ||
        context.read<UpdateDoctorTitleCubit>().certificatePhoto != null){
      context.read<UpdateDoctorTitleCubit>().emitDataChangedFromUser(true);
    } else {
      context.read<UpdateDoctorTitleCubit>().emitDataChangedFromUser(false);
    }
  }

  showDoctorTitles(context) {
    showAppModalBottomSheet(
      context: context,
      isDismissible: true,
      height: MediaQuery.sizeOf(context).height * 0.9,
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
                checkDataChanged();
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


  @override
  Widget build(BuildContext context) {
    return BlocListener<AddMediaCubit, AddMediaState>(
      listener: (context, state) {
        if (state is AddMediaSuccessState) {
          Navigator.pop(context);
          context.read<UpdateDoctorTitleCubit>().setTitleCertPath(
            path: state.values[0].path,
            url: state.values[0].url,
          );
          context.read<UpdateDoctorTitleCubit>().fUpdateDoctorTitle(
            titleId: doctorTitle?.id ?? 0,
          );
        }
        if (state is AddMediaErrorState) {
          Navigator.pop(context);
          showAppSnackBar(
              context: context,
              message: state.message,
              type: ToastType.error);
        }
        if (state is AddMediaLoadingState) {
          showAppDialog(
            context: context,
            isDismissible: false,
            child: LoadingDialog(
              message: Strings.uploadingPracticeLicenseFile,
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: colors.upBackGround,
        appBar: AppBar(
          title: Text(Strings.doctorTitle),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: colors.main.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          Strings.thisDetailsPatientView,
                          style: TextStyles.regular14(color: colors.main),
                        ),
                      ),
                      SizedBox(height: 24.h),

                      /// doctorTitles
                      MenuTextFormField(
                        controller: doctorTitleTextController,
                        focusNode: doctorTitleFocusNode,
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
                      SizedBox(height: 16.h),
                      /// certificate
                      InkWell(
                        onTap: () {
                          ImagePicker().pickMedia().then((value) {
                            if (value != null) {
                              final certificateFile = File(value.path);
                              super
                                  .context
                                  .read<UpdateDoctorTitleCubit>()
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
                          child: BlocBuilder<UpdateDoctorTitleCubit, UpdateDoctorTitleState>(
                            builder: (context, state) {
                              if (context.read<UpdateDoctorTitleCubit>().certificatePhoto != null) {
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
                  ),
                ),
              ),
            ),

            /// Button Save
            BlocConsumer<UpdateDoctorTitleCubit, UpdateDoctorTitleState>(
              listener: (context, state) {
                if(state is UpdateDoctorTitleErrorState){
                  showAppSnackBar(context: context, message: state.message, type: ToastType.error);
                }
                if(state is UpdateDoctorTitleSuccessState){
                  Navigator.pop(context);
                  showAppSnackBar(context: context, message: state.message, type: ToastType.success);
                  context.read<GetProfileCubit>().fGetProfile();
                  context.read<GetDoctorTitleCubit>().fGetDoctorTitle();
                }
              },
              builder: (context, state){
                if(state is UpdateDoctorTitleLoadingState){
                  return Center(
                    child: const CircularProgressIndicator().appLoading,
                  );
                }
                bool isDataChangedFromUser = context.read<UpdateDoctorTitleCubit>().isDataChangedFromUser;
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: AppElevatedButton(
                    onPressed: (){
                      if(isDataChangedFromUser && formKey.currentState!.validate()){
                        formKey.currentState!.save();
                        final photoFile = context.read<UpdateDoctorTitleCubit>().certificatePhoto;
                        if(photoFile != null){
                          context.read<AddMediaCubit>().fAddMedia(
                            id: 'certificatePhoto',
                            media: [photoFile],
                          );
                        } else {
                          showAppSnackBar(
                            context: context,
                            message: Strings.practiceLicenseFileIsRequired,
                            type: ToastType.warning,
                          );
                        }
                      }
                    },
                    text: Strings.save,
                    buttonRadius: 40.r,
                    buttonColor: isDataChangedFromUser? null : colors.iconColor,
                  ),
                );
              },
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}

