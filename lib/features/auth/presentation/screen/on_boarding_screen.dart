import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hania/config/locale/app_localizations.dart';
import 'package:hania/config/routes/app_routes.dart';
import 'package:hania/core/utils/values/text_styles.dart';
import 'package:hania/core/widgets/my_default_button.dart';
import '../../../../core/widgets/gaps.dart';
import '/core/utils/values/assets.dart';
import '/injection_container.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                colors.onBoardingColor,
                colors.onBoardingColor.withOpacity(.3)
              ],
            ),
          ),
          child: Column(
            children: [
              Image.asset(Assets.onBoardingImage),
              Gaps.vGap90,
              Text(
                'onboarding_titel'.tr,
                style: TextStyles.bold24(color: colors.main),
              ),
              Gaps.vGap20,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: Text(
                  'onboarding_details'.tr,
                  style: TextStyles.bold18(),
                ),
              ),
              Gaps.vGap40,
              MyDefaultButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.kindUserRoute,
                    (Route route) => false,
                  );
                },
                btnText: 'start_now',
                width: 170.w,
                borderRadius: 50.r,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // _submit() async {
  //   AppSharedPreferences.saveCheckFirst(false);
  //   Navigator.pushNamed(context, Routes.loginScreenRoute);
  // }
}
