import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utils/extension.dart';
import '../../../../core/utils/svg_manager.dart';
import '../../../../core/utils/values/assets.dart';
import '../../../../core/utils/values/strings.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../../../../core/widgets/app_image.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../../core/widgets/loading_dialog.dart';
import '../../../../core/widgets/show_dialog.dart';
import '../../../../core/widgets/show_modal_bottom_sheet.dart';
import '../../../../core/widgets/text_form_field.dart';
import '../../../../injection_container.dart';
import '../../../auth/presentation/widgets/select_gender.dart';
import '../../../portal/presentation/controller/add_media/add_media_cubit.dart';
import '../../domain/entities/get_profile_response.dart';
import '../cubit/get_profile/get_profile_cubit.dart';
import '../cubit/update_profile/update_profile_cubit.dart';
import '../widgets/update_email_dialog.dart';
import '../widgets/update_mobile_dialog.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController firstNameTextController = TextEditingController();
  final TextEditingController nationalIDTextController = TextEditingController();
  final TextEditingController dateOfBirthTextController = TextEditingController();
  final TextEditingController mobileNumberTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  final FocusNode mobileFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode firstNameFocus = FocusNode();
  final FocusNode nationalIDFocus = FocusNode();
  final FocusNode dateOfBirthFocus = FocusNode();
  String gender = 'male';
  String dateStr = '';

  String? originalGender;
  String? originalDateOfBirth;
  bool? isUserImageChanged;

  void setOriginalData(){
    originalGender = gender;
    originalDateOfBirth = dateStr;
    isUserImageChanged = false;
  }

  openCalender() {
    DateTime initDate = DateTime.now();
    if(dateStr.isNotEmpty){
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
          checkDataChanged();
        }
      });
    });
  }

  void fillUserData(User? user) {
    firstNameTextController.text = user?.firstname ?? '';
    mobileNumberTextController.text = user?.mobile ?? '';
    emailTextController.text = user?.email ?? '';
    nationalIDTextController.text = user?.doctor.nationalNumber ?? '';
    gender = user?.gender?? 'male';
    dateStr = user?.doctor.dob?? '';
    dateOfBirthTextController.text = dateStr;
  }

  void checkDataChanged(){
    if(gender != originalGender ||
        dateStr != originalDateOfBirth ||
        isUserImageChanged == true){
      context.read<UpdateProfileCubit>().emitDataChangedFromUser(true);
    } else {
      context.read<UpdateProfileCubit>().emitDataChangedFromUser(false);
    }
  }

  @override
  void initState() {
    super.initState();
    final User? user = context.read<GetProfileCubit>().user;
    fillUserData(user);
    setOriginalData();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (value){
        context.read<UpdateProfileCubit>().resetFields();
      },
      child: BlocListener<AddMediaCubit, AddMediaState>(
        listener: (context, state) {
          if (state is AddMediaSuccessState) {
            Navigator.pop(context);
            if(state.values.isNotEmpty){
              context.read<UpdateProfileCubit>().fUpdateProfile(
                dob: dateStr,
                gender: gender,
                photo: state.values[0],
              );
            }
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
                message: Strings.uploadingProfilePicture,
              ),
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(Strings.editMyData),
          ),
          body: Column(
            children: [
              /// Data
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Photo
                      Center(
                        child: GestureDetector(
                          onTap: (){
                            ImagePicker().pickImage(source: ImageSource.gallery).then((value){
                              if(value != null){
                                final imageFile = File(value.path);
                                context.read<UpdateProfileCubit>().setDoctorPhoto(imageFile);
                              }
                            });
                          },
                          child: BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                              builder: (context, state) {
                                return Stack(
                                  children: [
                                    Builder(
                                        builder: (context) {
                                          if(context.read<UpdateProfileCubit>().doctorPhoto != null){
                                            return AppImage.file(
                                              width: 80.w,
                                              height: 80.h,
                                              imageFile: context.read<UpdateProfileCubit>().doctorPhoto!,
                                              isCircle: true,
                                            );
                                          }
                                          return AppImage.network(
                                            width: 80.w,
                                            height: 80.h,
                                            imageUrl: context.read<GetProfileCubit>().user?.doctor.photo,
                                            isCircle: true,
                                          );
                                        }
                                    ),
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
                                          colorFilter: ColorFilterExtension.setColor(colors.baseColor),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      /// doctor name
                      AppTextFormField(
                        controller: firstNameTextController,
                        focusNode: firstNameFocus,
                        readOnly: true,
                        prefixIcon: Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 12.0.w),
                          child: SvgPicture.asset(
                            SvgAssets.user,
                            colorFilter: ColorFilterExtension.getFocusIconColor(firstNameFocus),
                          ),
                        ),
                        labelText: Strings.doctorName,
                        hintText: Strings.doctorName,
                      ),
                      SizedBox(height: 16.h),
                      /// national number
                      AppTextFormField(
                        controller: nationalIDTextController,
                        focusNode: nationalIDFocus,
                        readOnly: true,
                        prefixIcon: Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 12.0.w),
                          child: SvgPicture.asset(
                            Assets.iconsNationalId,
                            colorFilter: ColorFilterExtension.getFocusIconColor(nationalIDFocus),
                          ),
                        ),
                        labelText: Strings.nationalID,
                        hintText: Strings.nationalID,
                      ),
                      SizedBox(height: 16.h),
                      /// mobile
                      AppTextFormField(
                        controller: mobileNumberTextController,
                        focusNode: mobileFocus,
                        isPhone: true,
                        labelText: Strings.phoneNumber,
                        hintText: Strings.phoneNumber,
                        readOnly: true,
                        onTap: (){
                          showAppModalBottomSheet(
                            context: context,
                            child: const UpdateMobileDialog(),
                          );
                        },
                      ),
                      SizedBox(height: 16.h),
                      /// email
                      AppTextFormField(
                        controller: emailTextController,
                        focusNode: emailFocus,
                        labelText: Strings.email,
                        hintText: Strings.email,
                        readOnly: true,
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                          child: SvgPicture.asset(
                            SvgAssets.mail,
                            colorFilter: ColorFilterExtension.getFocusIconColor(emailFocus),
                          ),
                        ),
                        onTap: (){
                          showAppModalBottomSheet(
                            context: context,
                            child: const UpdateEmailDialog(),
                          );
                        },
                      ),
                      SizedBox(height: 16.h),
                      /// date of birth
                      AppTextFormField(
                        // onTap: () => openCalender(),
                        controller: dateOfBirthTextController,
                        focusNode: dateOfBirthFocus,
                        textInputAction: TextInputAction.done,
                        readOnly: true,
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                          child: SvgPicture.asset(
                            SvgAssets.calendar,
                            colorFilter: ColorFilterExtension.getFocusIconColor(dateOfBirthFocus),
                          ),
                        ),
                        labelText: Strings.dateOfBirth,
                        hintText: Strings.dateOfBirth,
                      ),
                      SizedBox(height: 16.h),
                      SelectGender(
                        currentGender: gender,
                        // updateView: (value) {
                        //   gender = value;
                        //   checkDataChanged();
                        // },
                      ),
                    ],
                  ),
                ),
              ),

              /// Button Save
              BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
                listener: (context, state) {
                  if(state is UpdateProfileErrorState){
                    showAppSnackBar(context: context, message: state.message, type: ToastType.error);
                  }
                  if(state is UpdateProfileSuccessState){
                    Navigator.pop(context);
                    // showAppSnackBar(context: context, message: Strings.personalDataEditedSuccessfully, type: ToastType.success);
                    showAppSnackBar(context: context, message: state.message, type: ToastType.success);
                    context.read<GetProfileCubit>().fGetProfile();
                    context.read<UpdateProfileCubit>().resetFields();
                  }
                },
                builder: (context, state){
                  if(state is UpdateProfileLoadingState){
                    return Center(
                      child: const CircularProgressIndicator().appLoading,
                    );
                  }
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: AppElevatedButton(
                      onPressed: (){
                        if(context.read<UpdateProfileCubit>().isDataChangedFromUser){
                          if(context.read<UpdateProfileCubit>().doctorPhoto != null){
                            context.read<AddMediaCubit>().fAddMedia(
                              id: 'profilePicture',
                              media: [context.read<UpdateProfileCubit>().doctorPhoto!],
                            );
                            return;
                          }
                          context.read<UpdateProfileCubit>().fUpdateProfile(
                            dob: dateStr,
                            gender: gender,
                          );
                        }
                      },
                      text: Strings.save,
                      buttonRadius: 40.r,
                      buttonColor: context.read<UpdateProfileCubit>().isDataChangedFromUser
                          ? null 
                          : colors.iconColor,
                    ),
                  );
                },
              ),
              SizedBox(height: 8.h),
            ],
          ),
        ),
      ),
    );
  }
}
