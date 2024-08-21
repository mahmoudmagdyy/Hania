import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hania/config/locale/app_localizations.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/validator.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/gaps.dart';
import '../../../../core/widgets/my_default_button.dart';
import '../../../../core/widgets/tags_text_form_field.dart';
import '../../../../injection_container.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.upBackGround,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'log_in_forget_pass'.tr,
          style: TextStyles.bold18(),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Column(
              children: [
                Gaps.vGap50,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 49.w),
                  child: Text(
                    'forget_phrase'.tr,
                    style: TextStyles.regular18(),
                  ),
                ),
                Gaps.vGap78,
                AppTextFormField(
                  controller: emailController,
                  focusNode: emailFocus,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  borderColor: colors.baseColor,
                  validatorType: ValidatorType.email,
                  hintText: 'email'.tr,
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
                      Navigator.pushNamed(
                        context,
                        Routes.credintialCodeRoute,
                      );
                    }
                  },
                  btnText: 'send',
                  borderColor: colors.baseColor,
                  width: 310.w,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
