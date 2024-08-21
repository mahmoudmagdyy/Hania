import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/extension.dart';
import '../../../../core/utils/svg_manager.dart';
import '../../../../core/utils/validator.dart';
import '../../../../core/utils/values/strings.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../../core/widgets/modal_bottom_sheet_scaffold.dart';
import '../../../../core/widgets/show_modal_bottom_sheet.dart';
import '../../../../core/widgets/text_form_field.dart';
import '../cubit/update_email_send_code/update_email_send_code_cubit.dart';
import 'update_email_verify_dialog.dart';

class UpdateEmailDialog extends StatefulWidget {
  const UpdateEmailDialog({super.key});

  @override
  State<UpdateEmailDialog> createState() => _UpdateEmailDialogState();
}

class _UpdateEmailDialogState extends State<UpdateEmailDialog> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailTextController = TextEditingController();
  final FocusNode emailFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    context.read<UpdateEmailSendCodeCubit>().emitInitState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalBottomSheetScaffold(
      title: Strings.editEmail,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(height: 16.h),
            AppTextFormField(
              controller: emailTextController,
              focusNode: emailFocus,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.emailAddress,
              validatorType: ValidatorType.email,
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                child: SvgPicture.asset(
                  SvgAssets.mail,
                  colorFilter: ColorFilterExtension.getFocusIconColor(emailFocus),
                ),
              ),
              labelText: Strings.email,
              hintText: Strings.email,
            ),
            SizedBox(height: 16.h),
            BlocConsumer<UpdateEmailSendCodeCubit, UpdateEmailSendCodeState>(
              listener: (context, state) {
                if(state is UpdateEmailSendCodeSuccessState){
                  Navigator.pop(context);
                  // showAppSnackBar(context: context, message: state.message, type: ToastType.success);
                  showAppModalBottomSheet(
                    context: context,
                    child: const UpdateEmailVerifyDialog(),
                  );
                }
                if(state is UpdateEmailSendCodeErrorState){
                  showAppSnackBar(context: context, message: state.message, type: ToastType.error);
                }
              },
              builder: (context, state){
                if(state is UpdateEmailSendCodeLoadingState){
                  return Center(child: const CircularProgressIndicator().appLoading);
                }
                return Column(
                  children: [
                    Builder(
                      builder: (context){
                        if(state is UpdateEmailSendCodeErrorState){
                          return Column(
                            children: [
                              Text(
                                state.message,
                                textAlign: TextAlign.center,
                                style: TextStyles.regular14(color: Colors.red),
                              ),
                              SizedBox(height: 8.h),
                            ],
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                    AppElevatedButton(
                      onPressed: () => onButtonPressed(context),
                      text: Strings.confirm,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  onButtonPressed(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      context.read<UpdateEmailSendCodeCubit>().fUpdateEmailSendCode(
        email: emailTextController.text.trim(),
      );
    }
  }
}
