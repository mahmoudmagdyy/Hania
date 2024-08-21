import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/config/routes/app_routes.dart';
import '/core/utils/values/assets.dart';
import '/core/widgets/app_elevated_button.dart';
import '/core/widgets/gaps.dart';
import '/injection_container.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/stepper.dart';

class OrderCompletedScreen extends StatelessWidget {
  const OrderCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            txt: 'الدفع',
          ),
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const StepperItem(
                  activeStep: 2,
                ),
                Gaps.vGap12,
                Row(
                  children: [
                    Flexible(
                        child: Image.asset(
                      Assets.orderCompleted,
                      fit: BoxFit.cover,
                    )),
                  ],
                ),
                Text(
                  'تم  الطلب بنجاح !',
                  style: TextStyles.bold16(),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        'مبروك ، لقد تم تسجيل طلبك برقم 12456. يمكنك متابعة طلبك من خلال ',
                    style: TextStyles.regular14(color: colors.textColor),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' تتبع الطلب',
                          style: TextStyles.regular14(color: colors.main)),
                    ],
                  ),
                ),
                Gaps.vGap50,
                AppElevatedButton(
                    text: 'الرئيسية',
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        Routes.tabBarScreenRoute,
                        (route) => false,
                      );
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
