import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/utils/extension.dart';
import '../../../../../core/utils/values/assets.dart';
import '../../../../../core/utils/values/strings.dart';
import '../../../../../core/utils/values/text_styles.dart';
import '../../../../../injection_container.dart';
import '../../../domain/entities/get_doctor_title_response.dart';
import '../../cubit/get_doctor_title/get_doctor_title_cubit.dart';
import '../../cubit/get_profile/get_profile_cubit.dart';

class DoctorTitleScreen extends StatefulWidget {
  const DoctorTitleScreen({super.key});

  @override
  State<DoctorTitleScreen> createState() => _DoctorTitleScreenState();
}

class _DoctorTitleScreenState extends State<DoctorTitleScreen> {

  String doctorTitleText = '';
  String doctorPracticeCertificate = '';

  @override
  void initState() {
    super.initState();
    context.read<GetProfileCubit>().fGetProfile();
  }

  void readLocalData(){
    if(context.read<GetProfileCubit>().user != null){
      final user = context.read<GetProfileCubit>().user!;
      if(user.doctor.readTitleFromApproval == true){
        context.read<GetDoctorTitleCubit>().fGetDoctorTitle();
      }
      doctorTitleText = user.doctor.title;
      doctorPracticeCertificate = user.doctor.practiceCert;
    }
  }

  void readGetDoctorTitleData(GetDoctorTitleResponseData data){
    doctorTitleText = data.doctorTitle.title;
    doctorPracticeCertificate = data.practiceCertificateUrl;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<GetProfileCubit, GetProfileState>(
          listener: (context, state) {
            if (state is GetProfileErrorState) {
              context.read<GetProfileCubit>().emitErrorStateListener(
                context: context,
                state: state,
              );
            }
            if (state is GetProfileSuccessState) {
              readLocalData();
            }
          },
        ),
        BlocListener<GetDoctorTitleCubit, GetDoctorTitleState>(
          listener: (context, state) {
            if(state is GetDoctorTitleErrorState){
              if(context.read<GetDoctorTitleCubit>().data != null){
                readGetDoctorTitleData(context.read<GetDoctorTitleCubit>().data!);
              }
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(Strings.doctorTitle),
          actions: [
            BlocBuilder<GetProfileCubit, GetProfileState>(
              builder: (BuildContext context, GetProfileState state){
                if (state is GetProfileLoadingState) {
                  return const SizedBox();
                }
                return BlocBuilder<GetDoctorTitleCubit, GetDoctorTitleState>(
                  builder: (context, state) {
                    if(state is GetDoctorTitleLoadingState){
                      return const SizedBox();
                    }
                    return IconButton(
                      onPressed: (){
                        Navigator.pushNamed(context, Routes.editDoctorTitleScreenRoute);
                      },
                      icon: SvgPicture.asset(Assets.iconsEdit),
                    );
                  },
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<GetDoctorTitleCubit, GetDoctorTitleState>(
          builder: (context, state) {
            if(state is GetDoctorTitleLoadingState){
              return Center(child: const CircularProgressIndicator().appLoading);
            }
            if(state is GetDoctorTitleSuccessState && state.value != null){
              readGetDoctorTitleData(state.value!);
            }
            return BlocBuilder<GetProfileCubit, GetProfileState>(
              builder: (context, profileState) {
                if(profileState is GetProfileLoadingState){
                  return Center(child: const CircularProgressIndicator().appLoading);
                }
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      state is GetDoctorTitleSuccessState && state.value != null
                          ? SizedBox(height: 4.h)
                          : const SizedBox(),
                      state is GetDoctorTitleSuccessState && state.value != null
                          ? Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                        color: colors.upBackGround,
                        child: Center(
                          child: Container(
                            width: MediaQuery.sizeOf(context).width,
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                            decoration: BoxDecoration(
                              color: colors.review.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Center(
                              child: Text(
                                Strings.underReview,
                                style: TextStyles.regular14(color: colors.review),
                              ),
                            ),
                          ),
                        ),
                      )
                          : const SizedBox(),
                      SizedBox(height: 4.h),
                      _BaseSection(
                        title: Strings.doctorTitle,
                        body: doctorTitleText,
                      ),
                      // SizedBox(height: 4.h),
                      // Container(
                      //   width: MediaQuery.sizeOf(context).width,
                      //   padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                      //   color: colors.upBackGround,
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         Strings.professionalLicenseFile,
                      //         style: TextStyles.medium14(color: colors.highlight),
                      //       ),
                      //       SizedBox(height: 8.h),
                      //       AppElevatedButton(
                      //         onPressed: () async{
                      //           try{
                      //             await doctorPracticeCertificate.launcherUrl;
                      //           }catch(e){
                      //             Future.delayed(Duration.zero, (){
                      //               showAppSnackBar(
                      //                 context: context,
                      //                 message: e.toString(),
                      //                 type: ToastType.error,
                      //               );
                      //             });
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
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _BaseSection extends StatelessWidget {
  final String title;
  final String body;

  const _BaseSection({
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      color: colors.upBackGround,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyles.medium14(color: colors.highlight),
          ),
          SizedBox(height: 8.h),
          Text(
            body,
            style: TextStyles.medium14(color: colors.body),
          ),
        ],
      ),
    );
  }
}
