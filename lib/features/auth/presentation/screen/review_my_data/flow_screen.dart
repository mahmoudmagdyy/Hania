import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/extension.dart';
import '../../../../../core/utils/values/assets.dart';
import '../../../../../core/utils/values/strings.dart';
import '../../../../../core/utils/values/text_styles.dart';
import '../../../../../core/widgets/app_elevated_button.dart';
import '../../../../../core/widgets/app_image.dart';
import '../../../../../core/widgets/app_outlined_button.dart';
import '../../../../../core/widgets/app_snack_bar.dart';
import '../../../../../core/widgets/cancel_account_dialog.dart';
import '../../../../../core/widgets/exit_app_dialog.dart';
import '../../../../../core/widgets/loading_dialog.dart';
import '../../../../../core/widgets/logout_dialog.dart';
import '../../../../../core/widgets/show_dialog.dart';
import '../../../../../injection_container.dart';
import '../../../../profile/presentation/cubit/get_profile/get_profile_cubit.dart';
import '../../cubit/auto_login/auto_login_cubit.dart';
import '../../cubit/delete_account/delete_account_cubit.dart';
import '../../cubit/logout/logout_cubit.dart';

class FlowScreen extends StatefulWidget {
  const FlowScreen({super.key});

  @override
  State<FlowScreen> createState() => _FlowScreenState();
}

class _FlowScreenState extends State<FlowScreen> {
  @override
  void initState() {
    super.initState();
    // context.read<GetProfileCubit>().fGetProfile();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      remoteConfigService.checkForUpdates(context);
    });
  }

  List<BlocListener> blocListeners = [
    BlocListener<DeleteAccountCubit, DeleteAccountState>(
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
    ),
    BlocListener<LogoutCubit, LogoutState>(
      listener: (context, state) {
        if (state is LogoutLoadingState) {
          showAppDialog(
            context: context,
            isDismissible: false,
            child: const LoadingDialog(),
          );
        }
        if (state is LogoutErrorState) {
          Navigator.pop(context);
          showAppSnackBar(
              context: context, message: state.message, type: ToastType.error);
        }
        if (state is LogoutSuccessState) {
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.loginScreenRoute, (route) => false);
        }
      },
    ),
    BlocListener<GetProfileCubit, GetProfileState>(
      listener: (context, state) {
        if (state is GetProfileErrorState) {
          context.read<GetProfileCubit>().emitErrorStateListener(
                context: context,
                state: state,
              );
        }
        if (state is GetProfileSuccessState) {
          if (state.value?.doctor.status == UserStatus.approved) {
            context
                .read<AutoLoginCubit>()
                .fLoggedApprovedUser(user: state.value);
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.tabBarScreenRoute,
              (route) => false,
            );
          }
        }
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (value) async {
        await showAppDialog(
              context: context,
              child: const ExitAppDialog(),
            ) ??
            false;
      },
      child: MultiBlocListener(
        listeners: blocListeners,
        child: Scaffold(
          backgroundColor: colors.baseColor,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.h,
                horizontal: 16.w,
              ),
              child: BlocBuilder<GetProfileCubit, GetProfileState>(
                builder: (context, state) {
                  if (state is GetProfileLoadingState) {
                    return Center(
                      child: const CircularProgressIndicator().appLoading,
                    );
                  }
                  final user = context.read<GetProfileCubit>().user;
                  return Column(
                    children: [
                      /// Logo
                      Builder(builder: (context) {
                        if (user?.doctor.status != UserStatus.refused) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  context.read<GetProfileCubit>().fGetProfile();
                                },
                                icon: Icon(
                                  Icons.refresh_rounded,
                                  color: colors.main,
                                  size: 24.r,
                                ),
                              ),
                              const Expanded(child: SizedBox()),
                              AppImage.asset(
                                imageAsset: Assets.iconsLogoWithoutText,
                              ),
                              const Expanded(child: SizedBox()),
                              IconButton(
                                onPressed: () => onLogout(),
                                icon: Icon(
                                  Icons.logout_rounded,
                                  color: colors.errorColor,
                                  size: 24.r,
                                ),
                              ),
                            ],
                          );
                        }
                        return AppImage.asset(
                          imageAsset: Assets.iconsLogoWithoutText,
                        );
                      }),

                      Builder(
                        builder: (context) {
                          if (user?.doctor.status == UserStatus.refused) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 24.h),
                                Text(
                                  Strings.apologyForAccountRejection,
                                  style: TextStyles.medium20(
                                      color: colors.highlight),
                                ),
                                SizedBox(height: 8.h),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount:
                                      user?.doctor.flow?.logs.comment.length ??
                                          0,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      children: [
                                        Text(
                                          '•',
                                          style: TextStyles.regular16(
                                              color: colors.body),
                                        ),
                                        SizedBox(width: 4.w),
                                        Expanded(
                                          child: Text(
                                            user?.doctor.flow?.logs
                                                    .comment[index] ??
                                                '',
                                            style: TextStyles.regular16(
                                                color: colors.body),
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            );
                          }
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 24.h),
                              AppImage.asset(
                                height: MediaQuery.sizeOf(context).height * 0.3,
                                imageAsset: Assets.gifsDataVerification,
                              ),
                              Text(
                                Strings.dataVerification,
                                style: TextStyles.medium20(
                                    color: colors.highlight),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                Strings.accountActivationMessage,
                                style: TextStyles.regular16(color: colors.body),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                user?.mobile ?? '',
                                style: TextStyles.medium16(
                                    color: colors.highlight),
                              ),
                            ],
                          );
                        },
                      ),

                      const Expanded(child: SizedBox()),

                      AppElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, Routes.reviewMyDataScreenRoute);
                        },
                        text: Strings.reviewMyData,
                      ),

                      SizedBox(height: 8.h),

                      AppOutlinedButton(
                        onPressed: () {
                          if (user?.doctor.status == UserStatus.refused) {
                            context.read<AutoLoginCubit>().fLogout();
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              Routes.loginScreenRoute,
                              (route) => false,
                            );
                          } else {
                            onCancelAccount();
                          }
                        },
                        text: (user?.doctor.status == UserStatus.refused)
                            ? Strings.registrationAgain
                            : Strings.cancelAccount,
                        textColor: (user?.doctor.status == UserStatus.refused)
                            ? null
                            : colors.errorColor,
                        borderColor: (user?.doctor.status == UserStatus.refused)
                            ? null
                            : colors.errorColor,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
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

  void onLogout() async {
    final bool isLogout = await showAppDialog(
          context: context,
          child: const LogoutDialog(),
        ) ??
        false;
    if (isLogout) {
      Future.delayed(Duration.zero, () async {
        context.read<LogoutCubit>().fLogout();
      });
    }
  }
}
