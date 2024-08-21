import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/config/routes/app_routes.dart';
import '/core/utils/gif_manager.dart';
import '/core/utils/svg_manager.dart';
import '../../../../core/utils/extension.dart';
import '../../../../core/utils/values/strings.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/app_outlined_button.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../../core/widgets/exit_app_dialog.dart';
import '../../../../core/widgets/show_dialog.dart';
import '../../../../injection_container.dart';
import '../cubit/verify_email/verify_email_cubit.dart';
import '../widgets/pin_widget.dart';

class VerificationEmailScreen extends StatefulWidget {
  const VerificationEmailScreen({
    super.key,
  });

  @override
  VerificationEmailScreenState createState() => VerificationEmailScreenState();
}

class VerificationEmailScreenState extends State<VerificationEmailScreen>
    with TickerProviderStateMixin {
  final TextEditingController controller = TextEditingController();
  final FocusNode codeFocus = FocusNode();
  int pinLength = 4;
  bool focus = true;
  final Duration timeOut = const Duration(seconds: 60);
  AnimationController? timeController;

  @override
  void initState() {
    super.initState();
    timeController = AnimationController(vsync: this, duration: timeOut);
    _initTimer();
  }

  @override
  void dispose() {
    timeController!.dispose();
    controller.dispose();
    super.dispose();
  }

  _initTimer() {
    timeController!.reverse(
        from: timeController!.value == 0.0 ? 1.0 : timeController!.value);
  }

  String get timerString {
    Duration duration = timeController!.duration! * timeController!.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

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
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: colors.upBackGround,
        appBar: AppBar(
          backgroundColor: colors.upBackGround,
        ),
        body: BlocConsumer<VerifyEmailCubit, VerifyEmailState>(
          listener: (BuildContext context, VerifyEmailState state) {
            if (state is VerifyEmailSuccessState) {
              goNext();
            } else if (state is VerifyEmailErrorState) {
              showAppSnackBar(
                  context: context,
                  message: state.message,
                  type: ToastType.error);
            }
          },
          builder: (BuildContext context, VerifyEmailState state) {
            return GestureDetector(
              onTap: () => unFocus(),
              child: Container(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  children: [
                    SizedBox(height: 16.h),
                    Container(
                      width: 80.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1.0,
                          color: colors.borderColor,
                        ),
                      ),
                      child: Image.asset(
                        GifAssets.otp,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      Strings.confirmEmail,
                      style: TextStyles.medium20(color: colors.highlight),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      Strings.enterConfirmationCodeSentToEmail,
                      style: TextStyles.regular16(),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      context.read<VerifyEmailCubit>().email ?? '',
                      style: TextStyles.medium16(),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.h),
                    PinCodeWidget(
                      pinLength: pinLength,
                      controller: controller,
                      focus: codeFocus,
                      textSubmit: (String text) => submitVerificationCode(text),
                    ),
                    SizedBox(height: 24.h),
                    AppOutlinedButton(
                      onPressed: () {
                        goNext();
                      },
                      text: Strings.skipVerificationNow,
                      borderColor: colors.body.withOpacity(0.15),
                    ),
                    SizedBox(height: 16.h),
                    (state is VerifyEmailLoadingState)
                        ? const CircularProgressIndicator().appLoading
                        : const SizedBox(),
                    (state is VerifyEmailErrorState)
                        ? const SizedBox(height: 8.0)
                        : const SizedBox(),
                    (state is VerifyEmailErrorState)
                        ? SizedBox(
                            width: double.infinity,
                            child: Text(
                              state.message,
                              textAlign: TextAlign.center,
                              style: TextStyles.regular16(color: Colors.red),
                            ),
                          )
                        : const SizedBox(),
                    const Spacer(),
                    Text(
                      Strings.weakNetwork,
                      style: TextStyles.regular12(),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8.h),
                    InkWell(
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: 50.h,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: colors.dividerColor,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(SvgAssets.whats),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                Strings.sendCodeViaWhatsApp,
                                textAlign: TextAlign.center,
                                style: TextStyles.medium16(color: colors.body),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void submitVerificationCode(String text) async {
    if (text.isNotEmpty && text.length == pinLength) {
      context.read<VerifyEmailCubit>().fVerifyEmail(
            email: context.read<VerifyEmailCubit>().email ?? '',
            code: text,
          );
    }
  }

  resendVerificationCode() async {
    // context.read<ResendEmailVerificationCubit>().fResendEmailVerification(
    //   email: context.read<VerifyEmailCubit>().email??'',
    // );
  }

  void goNext() {
    Future.delayed(Duration.zero, () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.landingPageRoute,
        (route) => false,
      );
    });
  }

  unFocus() {
    codeFocus.unfocus();
  }
}
