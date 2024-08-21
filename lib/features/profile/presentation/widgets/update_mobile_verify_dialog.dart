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
import '../cubit/update_mobile_send_code/update_mobile_send_code_cubit.dart';
import '../cubit/update_mobile_verify_code/update_mobile_verify_code_cubit.dart';

class UpdateMobileVerifyDialog extends StatefulWidget {
  const UpdateMobileVerifyDialog({super.key});

  @override
  State<UpdateMobileVerifyDialog> createState() => _UpdateMobileVerifyDialogState();
}

class _UpdateMobileVerifyDialogState extends State<UpdateMobileVerifyDialog> with TickerProviderStateMixin{
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
    context.read<UpdateMobileVerifyCodeCubit>().emitInitState();
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
      title: Strings.editPhoneNumber,
      child: Form(
        key: formKey,
        child: BlocConsumer<UpdateMobileVerifyCodeCubit, UpdateMobileVerifyCodeState>(
          listener: (context, state) {
            if(state is UpdateMobileVerifyCodeSuccessState){
              Navigator.pop(context);
              Navigator.pop(context);
              showAppSnackBar(context: context, message: state.message, type: ToastType.success);
              context.read<GetProfileCubit>().fGetProfile();
            }
          },
          builder: (context, state) {
            if(state is UpdateMobileVerifyCodeLoadingState){
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
                  context.read<UpdateMobileSendCodeCubit>().mobile,
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
                BlocConsumer<UpdateMobileSendCodeCubit, UpdateMobileSendCodeState>(
                  listener:
                      (BuildContext context, UpdateMobileSendCodeState resendState) {
                    _initTimer();
                  },
                  builder:
                      (BuildContext context, UpdateMobileSendCodeState resendState) {
                    return (resendState is UpdateMobileSendCodeLoadingState)
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
                (state is UpdateMobileVerifyCodeLoadingState)
                    ? const CircularProgressIndicator().appLoading
                    : const SizedBox(),
                (state is UpdateMobileVerifyCodeErrorState)
                    ? const SizedBox(height: 8.0)
                    : const SizedBox(),
                (state is UpdateMobileVerifyCodeErrorState)
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
      context.read<UpdateMobileVerifyCodeCubit>().fUpdateMobileVerifyCode(
        mobile: context.read<UpdateMobileSendCodeCubit>().mobileWithCode,
        code: text,
      );
    }
  }

  resendVerificationCode() async {
    context
        .read<UpdateMobileSendCodeCubit>()
        .fUpdateMobileSendCode(
      mobile: context.read<UpdateMobileSendCodeCubit>().mobile,
      callingCode: context.read<UpdateMobileSendCodeCubit>().callingCode,
    );
  }

  unFocus() {
    codeFocus.unfocus();
  }
}
