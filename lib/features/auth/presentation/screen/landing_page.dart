import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/extension.dart';
import '../../../../core/utils/values/strings.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../../../../injection_container.dart';
import '../../../profile/presentation/cubit/get_profile/get_profile_cubit.dart';
import '../cubit/auto_login/auto_login_cubit.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    context.read<GetProfileCubit>().fGetProfile();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: BlocConsumer<GetProfileCubit, GetProfileState>(
          listener: (context, state) {
            if (state is GetProfileErrorState) {
              context.read<GetProfileCubit>().emitErrorStateListener(
                    context: context,
                    state: state,
                  );
            }
            if (state is GetProfileSuccessState) {
              String screenRoute = '';
              if (state.value?.doctor.status == UserStatus.approved) {
                context
                    .read<AutoLoginCubit>()
                    .fLoggedApprovedUser(user: state.value);
                screenRoute = Routes.tabBarScreenRoute;
              }
              if (state.value?.doctor.status == UserStatus.pending) {
                context
                    .read<AutoLoginCubit>()
                    .fLoggedPendingUser(user: state.value);
                screenRoute = Routes.flowScreenRoute;
              }
              if (state.value?.doctor.status == UserStatus.refused) {
                context
                    .read<AutoLoginCubit>()
                    .fLoggedRefusedUser(user: state.value);
                screenRoute = Routes.flowScreenRoute;
              }
              Navigator.pushNamedAndRemoveUntil(
                  context, screenRoute, (route) => false);
            }
          },
          builder: (context, state) {
            if (state is GetProfileLoadingState) {
              return Center(
                child: const CircularProgressIndicator().appLoading,
              );
            }
            if (state is GetProfileErrorState) {
              return Padding(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      state.message,
                      style: TextStyles.medium16(color: colors.errorColor),
                      maxLines: 3,
                    ),
                    SizedBox(height: 32.h),
                    AppElevatedButton(
                      onPressed: () {
                        context.read<GetProfileCubit>().fGetProfile();
                      },
                      text: Strings.tryAgain,
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
