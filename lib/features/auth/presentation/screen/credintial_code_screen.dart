import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hania/config/locale/app_localizations.dart';
import 'package:hania/features/auth/presentation/widgets/pin_widget.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/gaps.dart';
import '../../../../core/widgets/my_default_button.dart';
import '../../../../injection_container.dart';

class CredintialCodeScreen extends StatefulWidget {
  const CredintialCodeScreen({super.key});

  @override
  State<CredintialCodeScreen> createState() => _CredintialCodeScreenState();
}

class _CredintialCodeScreenState extends State<CredintialCodeScreen> {
  TextEditingController pinCodeController = TextEditingController();
  FocusNode pinCodeFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.upBackGround,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'code_confirm'.tr,
          style: TextStyles.bold18(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Gaps.vGap45,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 57.w),
              child: Text(
                'code_phrase'.tr,
                style: TextStyles.regular18(),
                textAlign: TextAlign.center,
              ),
            ),
            Gaps.vGap78,
            PinCodeWidget(
              controller: pinCodeController,
              focus: pinCodeFocus,
              pinLength: 6,
              textSubmit: (value) {},
            ),
            Gaps.vGap78,
            MyDefaultButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  Routes.changePasswordRoute,
                );
              },
              btnText: 'next',
              borderColor: colors.baseColor,
              width: 310.w,
            ),
          ],
        ),
      ),
    );
  }
}
