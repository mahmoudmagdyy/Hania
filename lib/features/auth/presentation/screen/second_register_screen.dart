import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hania/config/locale/app_localizations.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/validator.dart';
import '../../../../core/utils/values/assets.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/gaps.dart';
import '../../../../core/widgets/my_default_button.dart';
import '../../../../core/widgets/tags_text_form_field.dart';
import '../../../../injection_container.dart';

class SecondRegisterScreen extends StatefulWidget {
  const SecondRegisterScreen({super.key});

  @override
  State<SecondRegisterScreen> createState() => _SecondRegisterScreenState();
}

class _SecondRegisterScreenState extends State<SecondRegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController phoneController = TextEditingController();
  FocusNode phoneFocus = FocusNode();
  TextEditingController emailController = TextEditingController();
  FocusNode emailFocus = FocusNode();
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
          'create_account'.tr,
          style: TextStyles.bold18(),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Gaps.vGap30,
                        AppTextFormField(
                          controller: phoneController,
                          focusNode: phoneFocus,
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          isPhone: false,
                          borderColor: colors.baseColor,
                          validatorType: ValidatorType.phone,
                          hintText: 'register_phone'.tr,
                        ),
                        Divider(
                          thickness: 2.h,
                          color: colors.dividerColor,
                        ),
                        Gaps.vGap35,
                        AppTextFormField(
                          controller: emailController,
                          focusNode: emailFocus,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          borderColor: colors.baseColor,
                          validatorType: ValidatorType.email,
                          hintText: 'log_in_enter_email'.tr,
                        ),
                        Divider(
                          thickness: 2.h,
                          color: colors.dividerColor,
                        ),
                        Gaps.vGap35,
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
                                  icon:
                                      const Icon(Icons.remove_red_eye_outlined))
                              : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isSecurePass = !isSecurePass;
                                    });
                                  },
                                  icon:
                                      const Icon(Icons.visibility_off_outlined),
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
                                      isSecureConfirmPass =
                                          !isSecureConfirmPass;
                                    });
                                  },
                                  icon:
                                      const Icon(Icons.remove_red_eye_outlined))
                              : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isSecureConfirmPass =
                                          !isSecureConfirmPass;
                                    });
                                  },
                                  icon:
                                      const Icon(Icons.visibility_off_outlined),
                                ),
                          hintText: 'confirm_password'.tr,
                        ),
                        Divider(
                          thickness: 2.h,
                          color: colors.dividerColor,
                        ),
                        Gaps.vGap35,
                        Container(
                          height: 185.h,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Assets.mapBackgroundImage),
                                fit: BoxFit.fitHeight),
                          ),
                          child: Container(
                            color: colors.buttonColor.withOpacity(.2),
                            child: Center(
                              child: Text(
                                'select_your_location'.tr,
                                style: TextStyles.regular18(
                                    color: colors.baseColor),
                              ),
                            ),
                          ),
                        ),
                        Gaps.vGap10,
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: colors.onBoardingColor,
                            ),
                            Gaps.hGap2,
                            Text(
                              'السعودية',
                              style: TextStyles.regular18(
                                  color: colors.onBoardingColor),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().screenHeight * .1,
                  child: Column(
                    children: [
                      LinearProgressIndicator(
                        value: 1,
                        valueColor: AlwaysStoppedAnimation<Color>(colors.main),
                        backgroundColor: colors.buttonColor2,
                      ),
                      Gaps.vGap20,
                      MyDefaultButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            Navigator.pushNamed(
                                context, Routes.loginScreenRoute);
                          }
                        },
                        btnText: 'create_account',
                        width: 310.w,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
