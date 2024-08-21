import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hania/config/locale/app_localizations.dart';
import 'package:hania/core/widgets/gaps.dart';

import '../../../../core/utils/values/text_styles.dart';

class DoctorSettingScreen extends StatelessWidget {
  const DoctorSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(16.0.r),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 25.r,
                    ),
                  ),
                  Gaps.hGap10,
                  Text(
                    'settings'.tr,
                    style: TextStyles.bold16(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
