import 'package:country_picker/country_picker.dart' as picker;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/config/locale/app_localizations.dart';
import '/config/routes/app_routes.dart';
import '/core/utils/validator.dart';
import '/core/utils/values/assets.dart';
import '/core/utils/values/text_styles.dart';
import '/core/widgets/gaps.dart';
import '/core/widgets/my_default_button.dart';
import '/core/widgets/tags_text_form_field.dart';
import '/features/auth/presentation/cubit/verify_otp/verify_otp_cubit.dart';
import '/features/auth/presentation/widgets/country_code_widget.dart';
import '../../../../core/utils/constants.dart';
import '../../../../injection_container.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  ResetPasswordScreenState createState() => ResetPasswordScreenState();
}

class ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController phoneController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();
  final FocusNode phoneFocus = FocusNode();
  picker.Country selectedCountry = Constants.egyptCountryPicker;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unFocus(),
      child: Scaffold(
        backgroundColor: colors.upBackGround,
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Gaps.vGap95,
                    Image.asset(Assets.reactiveLogoImage),
                    Gaps.vGap60,
                    Text(
                      'change_password'.tr,
                      style: TextStyles.bold16(),
                    ),
                    Gaps.vGap40,
                    Text(
                      'phone_number'.tr,
                      style: TextStyles.bold16(),
                    ),
                    Gaps.vGap22,
                    AppTextFormField(
                      controller: phoneController,
                      focusNode: phoneFocus,
                      hintText: 'phone_number'.tr,
                      labelText: 'phone_number'.tr,
                      backgroundColor: colors.unselected.withOpacity(.2),
                      keyboardType: TextInputType.phone,
                      validatorType: ValidatorType.phone,
                      isPhone: true,
                      suffix: AmrCountryCodeWidget(
                        country: selectedCountry,
                        showFlag: true,
                        updateValue: (picker.Country country) {
                          setState(() {
                            selectedCountry = country;
                            context.read<VerifyOtpCubit>().setCountry(country);
                          });
                        },
                      ),
                    ),
                    Gaps.vGap30,
                    MyDefaultButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          Navigator.pushNamed(
                              context, Routes.confirmResetPasswordScreenRoute);
                        }
                      },
                      btnText: 'next',
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }

  unFocus() {
    phoneFocus.unfocus();
  }
}
