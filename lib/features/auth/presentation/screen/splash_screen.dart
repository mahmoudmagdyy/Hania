import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/values/assets.dart';
import '../../../../injection_container.dart';
import '../cubit/auto_login/auto_login_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AutoLoginCubit>().getUserType();
  }

  void injectLocalizationAndColors() {
    // inject for once time
    try {
      // appLocalizations;
      colors;
    } catch (e) {
      // ServiceLocator.injectAppLocalizations(context: context);
      ServiceLocator.injectAppColors(context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    injectLocalizationAndColors();
    log('Localizations: ${appLocalizations.locale?.languageCode}');
    return BlocListener<AutoLoginCubit, AutoLoginState>(
      listener: (context, state) {
        log('UserType: ${state.userType}');
        _goNext(state.userType);
      },
      child: Scaffold(
        backgroundColor: colors.upBackGround,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                colors.onBoardingColor.withOpacity(.3),
                colors.onBoardingColor,
              ],
            ),
          ),
          child: Center(
            child: Image.asset(
              appLocalizations.isArLocale
                  ? Assets.imagesLogoAr
                  : Assets.imagesLogoEn,
            ),
          ),
        ),
      ),
    );
  }

  _goNext(UserType userType) {
    if (userType == UserType.firstOpen) {
      Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
    } else if (userType == UserType.login) {
      Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
    } else {
      Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
    }
  }
}
