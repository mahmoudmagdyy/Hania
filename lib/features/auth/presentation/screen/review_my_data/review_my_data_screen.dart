import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/utils/extension.dart';
import '../../../../../core/utils/values/strings.dart';
import '../../../../../core/utils/values/text_styles.dart';
import '../../../../../core/widgets/app_image.dart';
import '../../../../../core/widgets/app_outlined_button.dart';
import '../../../../../core/widgets/app_snack_bar.dart';
import '../../../../../core/widgets/cancel_account_dialog.dart';
import '../../../../../core/widgets/loading_dialog.dart';
import '../../../../../core/widgets/show_dialog.dart';
import '../../../../../injection_container.dart';
import '../../../../portal/domain/entities/get_specialities_response.dart';
import '../../../../profile/presentation/cubit/get_profile/get_profile_cubit.dart';
import '../../cubit/delete_account/delete_account_cubit.dart';

class ReviewMyDataScreen extends StatefulWidget {
  const ReviewMyDataScreen({super.key});

  @override
  State<ReviewMyDataScreen> createState() => _ReviewMyDataScreenState();
}

class _ReviewMyDataScreenState extends State<ReviewMyDataScreen> {
  String speciality = '';
  String subSpeciality = '';

  void setSpecialityString(List<Speciality> specialities) {
    if (specialities.length == 1) {
      speciality = specialities.first.title;
      return;
    }
    for (final item in specialities) {
      if (item.children.isNotEmpty) {
        speciality = item.title;
      } else {
        subSpeciality = item.title;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteAccountCubit, DeleteAccountState>(
      listener: (context, state) {
        if (state is DeleteAccountLoadingState) {
          showAppDialog(
            context: context,
            isDismissible: false,
            child: const LoadingDialog(),
          );
        }
        if (state is DeleteAccountErrorState) {
          Navigator.pop(context);
          showAppSnackBar(
              context: context, message: state.message, type: ToastType.error);
        }
        if (state is DeleteAccountSuccessState) {
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.loginScreenRoute, (route) => false);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(Strings.reviewMyData),
          actions: [
            BlocBuilder<GetProfileCubit, GetProfileState>(
              builder: (context, state) {
                if (state is! GetProfileLoadingState) {
                  return IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, Routes.editMyDataScreenRoute);
                    },
                    icon: const Icon(
                      Icons.edit_rounded,
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
        body: BlocBuilder<GetProfileCubit, GetProfileState>(
            builder: (context, state) {
          if (state is GetProfileLoadingState) {
            return Center(
              child: const CircularProgressIndicator().appLoading,
            );
          }
          final user = context.read<GetProfileCubit>().user;
          setSpecialityString(user?.doctor.specialities ?? []);
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                  child: Column(
                    children: [
                      /// Photo
                      BaseSection(
                        child: Center(
                          child: AppImage.network(
                            imageUrl: user?.doctor.photo,
                            width: 80.w,
                            height: 80.h,
                            isCircle: true,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),

                      SizedBox(height: 4.h),

                      /// first name
                      BaseSection(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Strings.doctorName,
                              style:
                                  TextStyles.medium14(color: colors.highlight),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              user?.firstname ?? '',
                              style: TextStyles.medium14(color: colors.body),
                            ),
                          ],
                        ),
                      ),

                      // SizedBox(height: 4.h),
                      //
                      // /// last name
                      // BaseSection(
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         Strings.lastName,
                      //         style: TextStyles.medium14(color: colors.highlight),
                      //       ),
                      //       SizedBox(height: 8.h),
                      //       Text(
                      //         user?.lastname?? '',
                      //         style: TextStyles.medium14(color: colors.body),
                      //       ),
                      //     ],
                      //   ),
                      // ),

                      SizedBox(height: 4.h),

                      /// nationalId
                      BaseSection(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Strings.nationalID,
                              style:
                                  TextStyles.medium14(color: colors.highlight),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              user?.doctor.nationalNumber ?? '',
                              style: TextStyles.medium14(color: colors.body),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 4.h),

                      // /// nationalIdImages
                      // BaseSection(
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         Strings.nationalIDImages,
                      //         style: TextStyles.medium14(),
                      //       ),
                      //       SizedBox(height: 8.h),
                      //       SizedBox(
                      //         height: MediaQuery.sizeOf(context).width * 0.35,
                      //         child: ListView.separated(
                      //           physics: const BouncingScrollPhysics(),
                      //           shrinkWrap: true,
                      //           scrollDirection: Axis.horizontal,
                      //           itemCount: user?.doctor.nationalIdImages.length?? 0,
                      //           itemBuilder: (context, index){
                      //             return ClipRRect(
                      //               borderRadius: BorderRadius.circular(8.r),
                      //               child: AppImage.network(
                      //                 width: MediaQuery.sizeOf(context).width * 0.4,
                      //                 height: MediaQuery.sizeOf(context).width * 0.35,
                      //                 imageUrl: user?.doctor.nationalIdImages[index],
                      //               ),
                      //             );
                      //           },
                      //           separatorBuilder: (context, index) => SizedBox(width: 4.w),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      //
                      // SizedBox(height: 4.h),

                      /// email
                      BaseSection(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Strings.email,
                              style:
                                  TextStyles.medium14(color: colors.highlight),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              user?.email ?? '',
                              style: TextStyles.medium14(color: colors.body),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 4.h),

                      /// mobile
                      BaseSection(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Strings.phoneNumber,
                              style:
                                  TextStyles.medium14(color: colors.highlight),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              user?.mobile ?? '',
                              style: TextStyles.medium14(color: colors.body),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 4.h),

                      /// date of birth
                      BaseSection(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Strings.dateOfBirth,
                              style:
                                  TextStyles.medium14(color: colors.highlight),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              user?.doctor.dob ?? '',
                              style: TextStyles.medium14(color: colors.body),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 4.h),

                      /// gender
                      BaseSection(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Strings.gender,
                              style:
                                  TextStyles.medium14(color: colors.highlight),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              user?.gender == 'male'
                                  ? Strings.male
                                  : Strings.female,
                              style: TextStyles.medium14(color: colors.body),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 4.h),

                      /// specialty
                      BaseSection(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Strings.mainSpecialty,
                              style:
                                  TextStyles.medium14(color: colors.highlight),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              speciality,
                              style: TextStyles.medium14(color: colors.body),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 4.h),

                      /// sub specialty
                      BaseSection(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Strings.subSpecialty,
                              style:
                                  TextStyles.medium14(color: colors.highlight),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              subSpeciality,
                              style: TextStyles.medium14(color: colors.body),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 4.h),

                      /// doctor title
                      BaseSection(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Strings.title,
                              style:
                                  TextStyles.medium14(color: colors.highlight),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              user?.doctor.title ?? '',
                              style: TextStyles.medium14(color: colors.body),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(height: 4.h),
                      //
                      //
                      // /// certificate
                      // BaseSection(
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         Strings.professionalLicenseDocument,
                      //         style: TextStyles.medium14(color: colors.highlight),
                      //       ),
                      //       SizedBox(height: 8.h),
                      //       AppElevatedButton(
                      //         onPressed: (){
                      //           try{
                      //             user?.doctor.practiceCert.launcherUrl;
                      //           }catch(e){
                      //             showAppSnackBar(context: context, message: e.toString(), type: ToastType.error);
                      //           }
                      //         },
                      //         text: Strings.viewDocument,
                      //         textStyle: TextStyles.regular14(color: colors.main),
                      //         buttonColor: colors.main.withOpacity(0.1),
                      //         iconSvg: Assets.iconsLicenceDocument,
                      //         iconColor: colors.main,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: AppOutlinedButton(
                  onPressed: () => onCancelAccount(),
                  text: Strings.cancelAccount,
                  textColor: colors.errorColor,
                  borderColor: colors.errorColor,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  void onCancelAccount() async {
    final bool isCancel = await showAppDialog(
          context: context,
          child: const CancelAccountDialog(),
        ) ??
        false;
    if (isCancel) {
      Future.delayed(Duration.zero, () async {
        final bool isConfirmedCancel = await showAppDialog(
              context: context,
              child: const ConfirmDeleteAccountDialog(),
            ) ??
            false;
        if (isConfirmedCancel) {
          Future.delayed(Duration.zero, () {
            context.read<DeleteAccountCubit>().fDeleteAccount();
          });
        }
      });
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
