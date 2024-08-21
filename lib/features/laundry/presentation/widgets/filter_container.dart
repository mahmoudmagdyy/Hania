import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/config/locale/app_localizations.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../injection_container.dart';

class FilterContainer extends StatelessWidget {
  const FilterContainer({super.key, required this.value, required this.title});
  final bool value;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: ScreenUtil().screenWidth * 0.3,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
          color: (value) ? colors.main : colors.upBackGround,
          border: Border.all(color: (value) ? colors.main : colors.borderColor),
          borderRadius: BorderRadius.circular(10.r)),
      child: Text(
        title.tr,
        style: TextStyles.regular15(
          color: (value) ? colors.upBackGround : colors.borderColor,
        ),
      ),
    );
  }
}
