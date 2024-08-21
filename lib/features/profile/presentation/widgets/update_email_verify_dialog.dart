import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/extension.dart';
import '../../../../core/utils/gif_manager.dart';
import '../../../../core/utils/values/strings.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../../core/widgets/modal_bottom_sheet_scaffold.dart';
import '../../../../injection_container.dart';
import '../../../auth/presentation/widgets/pin_widget.dart';
import '../cubit/get_profile/get_profile_cubit.dart';
import '../cubit/update_email_send_code/update_email_send_code_cubit.dart';
import '../cubit/update_email_verify_code/update_email_verify_code_cubit.dart';

class UpdateEmailVerifyDialog extends StatefulWidget {
  const UpdateEmailVerifyDialog({super.key});

  @override
  State<UpdateEmailVerifyDialog> createState() => _UpdateEmailVerifyDialogState();
}

class _UpdateEmailVerifyDialogState extends State<UpdateEmailVerifyDialog> with TickerProviderStateMixin{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController(text: '');
  final FocusNode codeFocus = FocusNode();
  int pinLength = 4;
  bool focus = true;
  final Duration timeOut = const Duration(seconds: 60);
  AnimationController? timeController;

  @override
  void initState() {
    super.initState();
    context.read<UpdateEmailVerifyCodeCubit>().emitInitState();
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
    return ModalBottomSheetScaffold(
      title: Strings.editEmail,
      child: Form(
        key: formKey,
        child: BlocConsumer<UpdateEmailVerifyCodeCubit, UpdateEmailVerifyCodeState>(
          listener: (context, state) {
            if(state is UpdateEmailVerifyCodeSuccessState){
              Navigator.pop(context);
              Navigator.pop(context);
              showAppSnackBar(context: context, message: state.message, type: ToastType.success);
              context.read<GetProfileCubit>().fGetProfile();
            }
          },
          builder: (context, state) {
            if(state is UpdateEmailVerifyCodeLoadingState){
              return Center(
                child: const CircularProgressIndicator().appLoading,
              );
            }
            return Column(
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
                  context.read<UpdateEmailSendCodeCubit>().email,
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
                BlocConsumer<UpdateEmailSendCodeCubit, UpdateEmailSendCodeState>(
                  listener:
                      (BuildContext context, UpdateEmailSendCodeState resendState) {
                    _initTimer();
                  },
                  builder:
                      (BuildContext context, UpdateEmailSendCodeState resendState) {
                    return (resendState is UpdateEmailSendCodeLoadingState)
                        ? const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    )
                        : Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width * 0.054),
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
                (state is UpdateEmailVerifyCodeLoadingState)
                    ? const CircularProgressIndicator().appLoading
                    : const SizedBox(),
                (state is UpdateEmailVerifyCodeErrorState)
                    ? const SizedBox(height: 8.0)
                    : const SizedBox(),
                (state is UpdateEmailVerifyCodeErrorState)
                    ? SizedBox(
                  width: double.infinity,
                  child: Text(
                    state.message,
                    textAlign: TextAlign.center,
                    style: TextStyles.regular16(color: Colors.red),
                  ),
                )
                    : const SizedBox(),
                SizedBox(height: 8.h),
              ],
            );
          },
        ),
      ),
    );
  }

  void submitVerificationCode(String text) async {
    if (text.isNotEmpty && text.length == pinLength) {
      context.read<UpdateEmailVerifyCodeCubit>().fUpdateEmailVerifyCode(
        email: context.read<UpdateEmailSendCodeCubit>().email,
        code: text,
      );
    }
  }

  resendVerificationCode() async {
    context
        .read<UpdateEmailSendCodeCubit>()
        .fUpdateEmailSendCode(
      email: context.read<UpdateEmailSendCodeCubit>().email,
    );
  }

  unFocus() {
    codeFocus.unfocus();
  }
}
