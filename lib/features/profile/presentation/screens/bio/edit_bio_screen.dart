import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/extension.dart';
import '../../../../../core/utils/svg_manager.dart';
import '../../../../../core/utils/validator.dart';
import '../../../../../core/utils/values/assets.dart';
import '../../../../../core/utils/values/strings.dart';
import '../../../../../core/utils/values/text_styles.dart';
import '../../../../../core/widgets/app_elevated_button.dart';
import '../../../../../core/widgets/app_snack_bar.dart';
import '../../../../../core/widgets/text_form_field.dart';
import '../../../../../injection_container.dart';
import '../../cubit/edit_bio/edit_bio_cubit.dart';
import '../../cubit/get_bio/get_bio_cubit.dart';
import '../../cubit/get_profile/get_profile_cubit.dart';

class EditBioScreen extends StatefulWidget {
  const EditBioScreen({super.key});

  @override
  State<EditBioScreen> createState() => _EditBioScreenState();
}

class _EditBioScreenState extends State<EditBioScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController firstnameArTextController = TextEditingController();
  final TextEditingController firstnameEnTextController = TextEditingController();
  final TextEditingController lastnameArTextController = TextEditingController();
  final TextEditingController lastnameEnTextController = TextEditingController();
  final TextEditingController bioArTextController = TextEditingController();
  final TextEditingController bioEnTextController = TextEditingController();
  final FocusNode firstnameArFocusNode = FocusNode();
  final FocusNode firstnameEnFocusNode = FocusNode();
  final FocusNode lastnameArFocusNode = FocusNode();
  final FocusNode lastnameEnFocusNode = FocusNode();
  final FocusNode bioArFocusNode = FocusNode();
  final FocusNode bioEnFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    context.read<EditBioCubit>().resetFields();
    readLocalData();
    setOriginalData();
  }

  void readLocalData(){
    if(context.read<GetProfileCubit>().user?.doctor.readBioFromApproval == true){
      final bioData = context.read<GetBioCubit>().data;
      firstnameArTextController.text = bioData?.firstName?.ar ?? '';
      lastnameArTextController.text = bioData?.lastName?.ar ?? '';
      firstnameEnTextController.text = bioData?.firstName?.en ?? '';
      lastnameEnTextController.text = bioData?.lastName?.en ?? '';
      bioArTextController.text = bioData?.bio?.ar ?? '';
      bioEnTextController.text = bioData?.bio?.en ?? '';
      return;
    }
    if(context.read<GetProfileCubit>().user != null){
      final user = context.read<GetProfileCubit>().user!;
      firstnameArTextController.text = user.doctor.firstnameAr;
      lastnameArTextController.text = user.doctor.lastnameAr;
      firstnameEnTextController.text = user.doctor.firstnameEn;
      lastnameEnTextController.text = user.doctor.lastnameEn;
      bioArTextController.text = user.doctor.bio?.ar?? '';
      bioEnTextController.text = user.doctor.bio?.en?? '';
    }
  }

  String? originalFirstnameAr;
  String? originalLastnameAr;
  String? originalFirstnameEn;
  String? originalLastnameEn;
  String? originalBioAr;
  String? originalBioEn;

  void setOriginalData(){
    originalFirstnameAr = firstnameArTextController.text;
    originalLastnameAr = lastnameArTextController.text;
    originalFirstnameEn = firstnameEnTextController.text;
    originalLastnameEn = lastnameEnTextController.text;
    originalBioAr = bioArTextController.text;
    originalBioEn = bioEnTextController.text;
  }

  void checkDataChanged(){
    if(firstnameArTextController.text.trim() != originalFirstnameAr ||
        lastnameArTextController.text.trim() != originalLastnameAr ||
        firstnameEnTextController.text.trim() != originalFirstnameEn ||
        lastnameEnTextController.text.trim() != originalLastnameEn ||
        bioArTextController.text.trim() != originalBioAr ||
        bioEnTextController.text.trim() != originalBioEn){
      context.read<EditBioCubit>().emitDataChangedFromUser(true);
    } else {
      context.read<EditBioCubit>().emitDataChangedFromUser(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.upBackGround,
      appBar: AppBar(
        title: Text(Strings.aboutDoctor),
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

                    Text(
                      '${Strings.doctorName} ${Strings.inArabic}',
                      style: TextStyles.medium13(),
                    ),
                    SizedBox(height: 16.h),
                    /// firstname ar
                    AppTextFormField(
                      controller: firstnameArTextController,
                      focusNode: firstnameArFocusNode,
                      textInputAction: TextInputAction.next,
                      validatorType: ValidatorType.standard,
                      onChanged: (value) => checkDataChanged(),
                      prefixIcon: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 12.w),
                        child: SvgPicture.asset(
                          SvgAssets.user,
                          colorFilter: ColorFilterExtension
                              .getFocusIconColor(firstnameArFocusNode),
                        ),
                      ),
                      labelText: Strings.firstName,
                      hintText: Strings.firstName,
                    ),
                    SizedBox(height: 8.h),
                    /// lastname ar
                    AppTextFormField(
                      controller: lastnameArTextController,
                      focusNode: lastnameArFocusNode,
                      textInputAction: TextInputAction.next,
                      validatorType: ValidatorType.standard,
                      onChanged: (value) => checkDataChanged(),
                      prefixIcon: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 12.w),
                        child: SvgPicture.asset(
                          SvgAssets.user,
                          colorFilter: ColorFilterExtension
                              .getFocusIconColor(lastnameArFocusNode),
                        ),
                      ),
                      labelText: Strings.lastName,
                      hintText: Strings.lastName,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      Strings.doctorNameInEnglish,
                      style: TextStyles.medium13(),
                    ),
                    SizedBox(height: 16.h),
                    /// firstname en
                    AppTextFormField(
                      controller: firstnameEnTextController,
                      focusNode: firstnameEnFocusNode,
                      textInputAction: TextInputAction.next,
                      validatorType: ValidatorType.standard,
                      onChanged: (value) => checkDataChanged(),
                      prefixIcon: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 12.w),
                        child: SvgPicture.asset(
                          Assets.iconsLanguage,
                          colorFilter: ColorFilterExtension
                              .getFocusIconColor(firstnameEnFocusNode),
                        ),
                      ),
                      labelText: Strings.firstName,
                      hintText: Strings.firstName,
                    ),
                    SizedBox(height: 8.h),
                    /// lastname en
                    AppTextFormField(
                      controller: lastnameEnTextController,
                      focusNode: lastnameEnFocusNode,
                      textInputAction: TextInputAction.next,
                      validatorType: ValidatorType.standard,
                      onChanged: (value) => checkDataChanged(),
                      prefixIcon: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 12.w),
                        child: SvgPicture.asset(
                          Assets.iconsLanguage,
                          colorFilter: ColorFilterExtension
                              .getFocusIconColor(lastnameEnFocusNode),
                        ),
                      ),
                      labelText: Strings.lastName,
                      hintText: Strings.lastName,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      Strings.displayedNameInDoctorProfileInsteadNameIDCard,
                      style: TextStyles.regular12(color: colors.body),
                    ),
                    SizedBox(height: 24.h),

                    AppTextFormField(
                      controller: bioArTextController,
                      focusNode: bioArFocusNode,
                      hintText: Strings.enterTextInArabic,
                      labelText: Strings.aboutDoctor,
                      validatorType: ValidatorType.standard,
                      onChanged: (value) => checkDataChanged(),
                      maxLines: 5,
                    ),
                    SizedBox(height: 16.h),
                    AppTextFormField(
                      controller: bioEnTextController,
                      focusNode: bioEnFocusNode,
                      hintText: '',
                      labelText: Strings.enterTextInEnglish,
                      validatorType: ValidatorType.standard,
                      onChanged: (value) => checkDataChanged(),
                      maxLines: 5,
                      prefixIcon: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 12.w),
                        child: SvgPicture.asset(
                          Assets.iconsLanguage,
                          colorFilter: ColorFilterExtension
                              .getFocusIconColor(bioEnFocusNode),
                        ),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      Strings.doctorBioAppearsInPersonalDoctorProfile,
                      style: TextStyles.regular12(color: colors.body),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// Button Save
          BlocConsumer<EditBioCubit, EditBioState>(
            listener: (context, state) {
              if(state is EditBioErrorState){
                showAppSnackBar(context: context, message: state.message, type: ToastType.error);
              }
              if(state is EditBioSuccessState){
                Navigator.pop(context);
                showAppSnackBar(context: context, message: state.message, type: ToastType.success);
                context.read<GetProfileCubit>().fGetProfile();
                context.read<GetBioCubit>().fGetBio();
              }
            },
            builder: (context, state){
              if(state is EditBioLoadingState){
                return Center(
                  child: const CircularProgressIndicator().appLoading,
                );
              }
              bool isDataChangedFromUser = context.read<EditBioCubit>().isDataChangedFromUser;
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: AppElevatedButton(
                  onPressed: (){
                    if(isDataChangedFromUser && formKey.currentState!.validate()){
                      formKey.currentState!.save();
                      context.read<EditBioCubit>().fEditBio(
                        bio: {
                          'ar': bioArTextController.text.trim(),
                          'en': bioEnTextController.text.trim(),
                        },
                        firstname: {
                          'ar': firstnameArTextController.text.trim(),
                          'en': firstnameEnTextController.text.trim(),
                        },
                        lastname: {
                          'ar': lastnameArTextController.text.trim(),
                          'en': lastnameEnTextController.text.trim(),
                        },
                      );
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
    );
  }
}

