import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../injection_container.dart';
import '../utils/values/strings.dart';
import '../utils/values/text_styles.dart';
import 'app_outlined_button.dart';

class RegisterBackDialog extends StatelessWidget {
  const RegisterBackDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            Strings.backToLogin,
            style: TextStyles.semiBold20(),
          ),
          SizedBox(height: 24.h),
          Text(
            Strings.backToLoginMessage,
            style: TextStyles.regular14(),
          ),
          SizedBox(height: 32.h),
          Row(
            children: [
              Expanded(
                child: AppOutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  text: Strings.back,
                  borderColor: colors.errorColor,
                  textColor: colors.errorColor,
                  backgroundColor: Colors.white,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: AppOutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  text: Strings.no,
                  backgroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
