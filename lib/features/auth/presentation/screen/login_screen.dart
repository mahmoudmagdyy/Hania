import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/config/locale/app_localizations.dart';
import '/core/utils/values/assets.dart';
import '/core/widgets/gaps.dart';
import '/core/widgets/my_default_button.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/validator.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/exit_app_dialog.dart';
import '../../../../core/widgets/show_dialog.dart';
import '../../../../core/widgets/text_form_field.dart';
import '../../../../injection_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode passwordFocus = FocusNode();
  bool isSecure = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      remoteConfigService.checkForUpdates(context);
    });
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
      child: GestureDetector(
        onTap: () => unFocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: colors.upBackGround,
          body: Form(
            key: _formKey,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gaps.vGap20,
                      Text(
                        'log_in'.tr,
                        style: TextStyles.bold18(),
                      ),
                      Gaps.vGap10,
                      Text(
                        'log_in_details'.tr,
                        style: TextStyles.regular18(),
                      ),
                      Gaps.vGap50,
                      Row(
                        children: [
                          SvgPicture.asset(Assets.emailIconSvg),
                          Gaps.hGap4,
                          Text(
                            'log_in_email'.tr,
                            style: TextStyles.bold18(),
                          )
                        ],
                      ),
                      Gaps.vGap8,
                      AppTextFormField(
                        controller: emailController,
                        focusNode: emailFocus,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validatorType: ValidatorType.email,
                        hintText: 'log_in_enter_email'.tr,
                      ),
                      Gaps.vGap45,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(Assets.passIconSvg),
                          Gaps.hGap4,
                          Text(
                            'password'.tr,
                            style: TextStyles.bold18(),
                          )
                        ],
                      ),
                      Gaps.vGap8,
                      AppTextFormField(
                        obscureText: isSecure,
                        controller: passwordController,
                        focusNode: passwordFocus,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        validatorType: ValidatorType.password,
                        suffixIcon: isSecure
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    isSecure = !isSecure;
                                  });
                                },
                                icon: const Icon(Icons.remove_red_eye_outlined))
                            : IconButton(
                                onPressed: () {
                                  setState(() {
                                    isSecure = !isSecure;
                                  });
                                },
                                icon: const Icon(Icons.visibility_off_outlined),
                              ),
                        hintText: 'log_in_enter_pass'.tr,
                      ),
                      Gaps.vGap20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.forgetPasswordRoute);
                            },
                            child: Text(
                              'log_in_forget_pass'.tr,
                              style: TextStyles.regular16(
                                  color: colors.onBoardingColor),
                            ),
                          )
                        ],
                      ),
                      Gaps.vGap78,
                      Center(
                        child: MyDefaultButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                Routes.tabBarScreenRoute,
                                (Route<dynamic> route) => false,
                              );
                            }
                          },
                          btnText: 'logintxt',
                          borderColor: colors.baseColor,
                          width: 310.w,
                        ),
                      ),
                      Gaps.vGap78,
                      Center(
                        child: MyDefaultButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                Routes.doctorHomeScreenRoute,
                                (Route<dynamic> route) => false,
                              );
                            }
                          },
                          btnText: 'doctor',
                          borderColor: colors.baseColor,
                          width: 310.w,
                        ),
                      ),
                      Gaps.vGap60,
                      Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'register_quation'.tr,
                              style: TextStyles.regular18(),
                            ),
                            Gaps.hGap2,
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.registerScreenRoute);
                              },
                              child: Text(
                                'create_account'.tr,
                                style: TextStyles.regular18(
                                    color: colors.onBoardingColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  onLoginPressed(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  // login() async {
  //   try {
  //     await Constants.phoneParsing(
  //       phone: phoneController.text.trim(),
  //       countryCode: selectedCountry.countryCode,
  //     ).then((String? phoneParsed) {
  //       if (phoneParsed == null) {
  //         showAppSnackBar(
  //             context: context,
  //             message: Strings.errorValidPhoneNumber,
  //             type: ToastType.error);
  //         return;
  //       }
  //       context.read<CheckMobileCubit>().fCheckMobile(
  //             mobile: phoneParsed,
  //             callingCode: selectedCountry.phoneCode,
  //           );
  //     });
  //   } on PlatformException catch (e) {
  //     Future.delayed(Duration.zero, () {
  //       showAppSnackBar(
  //           context: context, message: e.message ?? '', type: ToastType.error);
  //     });
  //   }
  // }

  onEmailPressed() {
    Navigator.pushNamed(context, Routes.emailLoginScreenRoute);
  }

  unFocus() {
    emailFocus.unfocus();
    passwordFocus.unfocus();
  }
}
