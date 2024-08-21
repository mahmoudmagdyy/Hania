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
import '../../../domain/entities/get_bio_response.dart';
import '../../cubit/get_bio/get_bio_cubit.dart';
import '../../cubit/get_profile/get_profile_cubit.dart';

class BioScreen extends StatefulWidget {
  const BioScreen({super.key});

  @override
  State<BioScreen> createState() => _BioScreenState();
}

class _BioScreenState extends State<BioScreen> {

  String displayDoctorNameAr = '';
  String displayDoctorNameEn = '';
  String aboutDoctorAr = '';
  String aboutDoctorEn = '';

  @override
  void initState() {
    super.initState();
    context.read<GetProfileCubit>().fGetProfile();
  }

  void readLocalData(){
    if(context.read<GetProfileCubit>().user != null){
      final user = context.read<GetProfileCubit>().user!;
      if(user.doctor.readBioFromApproval == true){
        context.read<GetBioCubit>().fGetBio();
      } else {
        displayDoctorNameAr = '${user.doctor.firstnameAr} ${user.doctor.lastnameAr}';
        displayDoctorNameEn = '${user.doctor.firstnameEn} ${user.doctor.lastnameEn}';
        aboutDoctorAr = user.doctor.bio?.ar?? '';
        aboutDoctorEn = user.doctor.bio?.en?? '';
      }
    }
  }

  void readGetBioData(BioData data){
    displayDoctorNameAr = '${data.firstName?.ar ?? ''} ${data.lastName?.ar ?? ''}';
    displayDoctorNameEn = '${data.firstName?.en ?? ''} ${data.lastName?.en ?? ''}';
    aboutDoctorAr = data.bio?.ar ?? '';
    aboutDoctorEn = data.bio?.en ?? '';
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
        BlocListener<GetBioCubit, GetBioState>(
          listener: (context, state) {
            if(state is GetBioErrorState){
              if(context.read<GetBioCubit>().data != null){
                readGetBioData(context.read<GetBioCubit>().data!);
              }
            }
            if(state is GetBioSuccessState && state.value != null){
              readGetBioData(state.value!);
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(Strings.aboutDoctor),
          actions: [
            BlocBuilder<GetProfileCubit, GetProfileState>(
              builder: (BuildContext context, GetProfileState state){
                if(state is GetProfileLoadingState){
                  return const SizedBox();
                }
                return BlocBuilder<GetBioCubit, GetBioState>(
                  builder: (context, state) {
                    if(state is GetBioLoadingState){
                      return const SizedBox();
                    }
                    return IconButton(
                      onPressed: (){
                        Navigator.pushNamed(context, Routes.editBioScreenRoute);
                      },
                      icon: SvgPicture.asset(Assets.iconsEdit),
                    );
                  },
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<GetBioCubit, GetBioState>(
          builder: (context, bioState) {
            if(bioState is GetBioLoadingState){
              return Center(child: const CircularProgressIndicator().appLoading);
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
                        Builder(
                          builder: (context) {
                            final bool isReadFromBio = context.read<GetProfileCubit>()
                                .user?.doctor.readBioFromApproval == true;
                            if(isReadFromBio
                                && bioState is GetBioSuccessState
                                && bioState.value != null){
                              return Container(
                                margin: EdgeInsets.only(top: 4.h),
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
                              );
                            }
                            return const SizedBox();
                          },
                        ),
                        
                        SizedBox(height: 4.h),
                        _BaseSection(
                          title: Strings.presentedDoctorName,
                          body: displayDoctorNameAr,
                        ),
                        SizedBox(height: 4.h),
                        _BaseSection(
                          title: '${Strings.presentedDoctorName} (${Strings.inEnglish})',
                          body: displayDoctorNameEn,
                        ),
                        SizedBox(height: 4.h),
                        _BaseSection(
                          title: Strings.aboutDoctor,
                          body: aboutDoctorAr,
                        ),
                        SizedBox(height: 4.h),
                        _BaseSection(
                          title: '${Strings.aboutDoctor} (${Strings.inEnglish})',
                          body: aboutDoctorEn,
                        ),
                      ],
                    ),
                  );
                }
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
