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
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../../injection_container.dart';
import '../cubit/check_mobile/check_mobile_cubit.dart';
import '../cubit/verify_otp/verify_otp_cubit.dart';
import '../widgets/pin_widget.dart';

class VerificationMobileScreen extends StatefulWidget {
  const VerificationMobileScreen({
    super.key,
  });

  @override
  VerificationMobileScreenState createState() =>
      VerificationMobileScreenState();
}

class VerificationMobileScreenState extends State<VerificationMobileScreen>
    with TickerProviderStateMixin {
  final TextEditingController controller = TextEditingController(text: '');
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
    double screenWidth = MediaQuery.sizeOf(context).width;
    double padding = screenWidth * 0.054;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colors.upBackGround,
      appBar: AppBar(
        backgroundColor: colors.upBackGround,
      ),
      body: BlocConsumer<VerifyOtpCubit, VerifyOtpState>(
        listener: (BuildContext context, VerifyOtpState state) {
          if (state is VerifyOtpSuccessState) {
            Future.delayed(Duration.zero, () {
              if (state.isRegister) {
                Navigator.pushReplacementNamed(
                  context,
                  Routes.registerScreenRoute,
                );
              } else {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.landingPageRoute,
                  (route) => false,
                );
              }
            });
          }
          if (state is VerifyOtpErrorState) {
            showAppSnackBar(
              context: context,
              message: state.message,
              type: ToastType.error,
            );
          }
        },
        builder: (BuildContext context, VerifyOtpState state) {
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
                    Strings.confirmMobileNumber,
                    style: TextStyles.medium20(color: colors.highlight),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    Strings.enterConfirmationCodeSentToNumber,
                    style: TextStyles.regular16(),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    context.read<VerifyOtpCubit>().mobileWithCallingCode ?? '',
                    style: TextStyles.medium16(),
                    textAlign: TextAlign.center,
                    textDirection: appLocalizations.isEnLocale
                        ? TextDirection.ltr
                        : TextDirection.rtl,
                  ),
                  SizedBox(height: 16.h),
                  PinCodeWidget(
                    pinLength: pinLength,
                    controller: controller,
                    focus: codeFocus,
                    textSubmit: (String text) => submitVerificationCode(text),
                  ),
                  SizedBox(height: 24.h),
                  BlocConsumer<CheckMobileCubit, CheckMobileState>(
                    listener:
                        (BuildContext context, CheckMobileState resendState) {
                      _initTimer();
                    },
                    builder:
                        (BuildContext context, CheckMobileState resendState) {
                      return (resendState is CheckMobileLoadingState)
                          ? Center(
                              child:
                                  const CircularProgressIndicator().appLoading,
                            )
                          : Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: padding),
                              child: AnimatedBuilder(
                                animation: timeController!,
                                builder: (BuildContext context, Widget? child) {
                                  return Container(
                                    width: 200.w,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.w, vertical: 8.h),
                                    decoration: BoxDecoration(
                                      color: timeController!.value > 0.0
                                          ? const Color(0x19B2B8B4)
                                          : const Color(0x1946B399),
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: InkWell(
                                      onTap: () => resendVerificationCode(),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            Strings.resendCode,
                                            style: TextStyles.medium14(
                                                color:
                                                    timeController!.value > 0.0
                                                        ? colors.iconColor
                                                        : colors.main),
                                          ),
                                          SizedBox(width: 4.w),
                                          timeController!.value > 0.0
                                              ? Text(
                                                  '($timerString)',
                                                  style: TextStyles.medium14(
                                                      color: timeController!
                                                                  .value >
                                                              0.0
                                                          ? colors.iconColor
                                                          : colors.main),
                                                )
                                              : const SizedBox(),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                    },
                  ),
                  SizedBox(height: 16.h),
                  (state is VerifyOtpLoadingState)
                      ? const CircularProgressIndicator().appLoading
                      : const SizedBox(),
                  (state is VerifyOtpErrorState)
                      ? const SizedBox(height: 8.0)
                      : const SizedBox(),
                  (state is VerifyOtpErrorState)
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
                      width: screenWidth,
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
    );
  }

  void submitVerificationCode(String text) async {
    if (text.isNotEmpty && text.length == pinLength) {
      context.read<VerifyOtpCubit>().fVerifyOtp(
            mobile: context.read<VerifyOtpCubit>().mobileWithCallingCode ?? '',
            code: text,
          );
    }
  }

  resendVerificationCode() async {
    context.read<CheckMobileCubit>().fCheckMobile(
          mobile: context.read<VerifyOtpCubit>().mobile ?? '',
          callingCode: context.read<VerifyOtpCubit>().callingCode ?? '',
        );
  }

  unFocus() {
    codeFocus.unfocus();
  }
}
