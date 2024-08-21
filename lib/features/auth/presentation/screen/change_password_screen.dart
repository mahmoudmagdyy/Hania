import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hania/config/locale/app_localizations.dart';
import 'package:hania/core/widgets/gaps.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/validator.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/my_default_button.dart';
import '../../../../core/widgets/text_form_field.dart';
import '../../../../injection_container.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocus = FocusNode();
  TextEditingController configPasswordController = TextEditingController();
  FocusNode configPasswordFocus = FocusNode();
  bool isSecurePass = true;
  bool isSecureConfirmPass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.upBackGround,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'newPass'.tr,
          style: TextStyles.bold18(),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w),
          child: Column(
            children: [
              Gaps.vGap45,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 49.w),
                child: Text(
                  'new_pass_phrase'.tr,
                  style: TextStyles.regular18(),
                  textAlign: TextAlign.center,
                ),
              ),
              Gaps.vGap78,
              AppTextFormField(
                obscureText: isSecurePass,
                controller: passwordController,
                focusNode: passwordFocus,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                borderColor: colors.baseColor,
                validatorType: ValidatorType.password,
                suffixIcon: isSecurePass
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            isSecurePass = !isSecurePass;
                          });
                        },
                        icon: const Icon(Icons.remove_red_eye_outlined))
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            isSecurePass = !isSecurePass;
                          });
                        },
                        icon: const Icon(Icons.visibility_off_outlined),
                      ),
                hintText: 'log_in_enter_pass'.tr,
              ),
              Divider(
                thickness: 2.h,
                color: colors.dividerColor,
              ),
              Gaps.vGap35,
              AppTextFormField(
                obscureText: isSecureConfirmPass,
                controller: configPasswordController,
                focusNode: configPasswordFocus,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                borderColor: colors.baseColor,
                validatorType: ValidatorType.password,
                suffixIcon: isSecureConfirmPass
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            isSecureConfirmPass = !isSecureConfirmPass;
                          });
                        },
                        icon: const Icon(Icons.remove_red_eye_outlined))
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            isSecureConfirmPass = !isSecureConfirmPass;
                          });
                        },
                        icon: const Icon(Icons.visibility_off_outlined),
                      ),
                hintText: 'confirm_password'.tr,
              ),
              Divider(
                thickness: 2.h,
                color: colors.dividerColor,
              ),
              Gaps.vGap78,
              MyDefaultButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.loginScreenRoute,
                      (Route<dynamic> route) => false,
                    );
                  }
                },
                btnText: 'submit',
                borderColor: colors.baseColor,
                width: 310.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
