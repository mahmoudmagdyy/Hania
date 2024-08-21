import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/extension.dart';
import '../../../../core/utils/svg_manager.dart';
import '../../../../core/utils/validator.dart';
import '../../../../core/utils/values/strings.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../../core/widgets/loading_view.dart';
import '../../../../core/widgets/text_form_field.dart';
import '../../../../injection_container.dart';
import '../cubit/login_email/login_email_cubit.dart';

class EmailLoginScreen extends StatefulWidget {
  const EmailLoginScreen({super.key});

  @override
  EmailLoginScreenState createState() => EmailLoginScreenState();
}

class EmailLoginScreenState extends State<EmailLoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  late double screenWidth;
  late double screenHeight;
  late double padding;

  bool _obscureText = true;
  Country? selectedCountry;

  String? phone;
  String? password;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    padding = screenWidth * 0.084;
    return GestureDetector(
      onTap: () => unFocus(),
      child: Scaffold(
        appBar: AppBar(backgroundColor: colors.upBackGround),
        backgroundColor: colors.upBackGround,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: padding, right: padding),
              child: BlocConsumer<LoginEmailCubit, LoginEmailState>(
                listener: (context, state) {
                  if (state is LoginEmailSuccessState) {
                    if (state.value?.user == null) {
                      Navigator.pushNamed(
                        context,
                        Routes.verificationEmailScreenRoute,
                      );
                    } else {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        Routes.landingPageRoute,
                        (Route<dynamic> route) => false,
                      );
                    }
                  }
                  if (state is LoginEmailErrorState) {
                    showAppSnackBar(
                        context: context,
                        message: state.message,
                        type: ToastType.error);
                  }
                },
                builder: (context, state) {
                  return Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      children: [
                        SizedBox(height: 24.h),
                        Text(
                          Strings.createAccountOrLogin,
                          style: TextStyles.medium20(color: colors.highlight),
                        ),
                        SizedBox(height: 32.h),
                        AppTextFormField(
                          controller: emailController,
                          focusNode: emailFocus,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          validatorType: ValidatorType.email,
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                            child: SvgPicture.asset(
                              SvgAssets.mail,
                              colorFilter: iconColor(emailFocus),
                            ),
                          ),
                          labelText: Strings.email,
                          hintText: Strings.email,
                        ),
                        SizedBox(height: 16.h),
                        AppTextFormField(
                          controller: passwordController,
                          focusNode: passwordFocus,
                          textInputAction: TextInputAction.done,
                          validatorType: ValidatorType.password,
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                            child: SvgPicture.asset(
                              SvgAssets.lock,
                              colorFilter: iconColor(passwordFocus),
                            ),
                          ),
                          labelText: Strings.password,
                          hintText: Strings.password,
                          obscureText: _obscureText,
                          suffix: GestureDetector(
                            onTap: () {
                              _toggle();
                            },
                            child: FaIcon(
                              _obscureText
                                  ? FontAwesomeIcons.eye
                                  : FontAwesomeIcons.eyeSlash,
                              size: 16.r,
                            ),
                          ),
                          onSaved: (value) {},
                        ),
                        SizedBox(height: 24.h),
                        (state is LoginEmailLoadingState)
                            ? const LoadingView()
                            : AppElevatedButton(
                                onPressed: () => onLoginPressed(context),
                                text: Strings.login,
                              ),
                        (state is LoginEmailErrorState)
                            ? const SizedBox(height: 16.0)
                            : const SizedBox(),
                        (state is LoginEmailErrorState)
                            ? SizedBox(
                                width: double.infinity,
                                child: Text(
                                  state.message,
                                  textAlign: TextAlign.center,
                                  style:
                                      TextStyles.regular14(color: Colors.red),
                                ),
                              )
                            : const SizedBox(),
                        SizedBox(height: 16.h),
                        TextButton(
                          onPressed: () => onForgotPressed(),
                          child: Text(
                            Strings.resetPassword,
                            style: TextStyles.regular12(color: colors.main),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLoading() {
    return Container(
      color: Colors.transparent,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(colors.main),
        ).appLoading,
      ),
    );
  }

  onLoginPressed(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<LoginEmailCubit>().fLoginEmail(
          email: emailController.text, password: passwordController.text);
    }
  }

  onForgotPressed() async {
    Navigator.pushNamed(context, Routes.resetPasswordRoute);
  }

  unFocus() {
    emailFocus.unfocus();
    passwordFocus.unfocus();
  }

  ColorFilter iconColor(FocusNode focusNode) {
    return ColorFilter.mode(
      focusNode.hasFocus ? colors.main : colors.body,
      BlendMode.srcIn,
    );
  }
}
