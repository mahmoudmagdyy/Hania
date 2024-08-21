import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hania/core/utils/app_colors.dart';

import '../../../../core/utils/svg_manager.dart';
import '../../../../core/utils/values/assets.dart';
import '../../../../core/utils/values/text_styles.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            width: 1,
            color: Colors.grey,
          )),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "وصف الحالة الطبية",
              style: TextStyles.bold18(color: MyColors.main),
            ),
            Text(
              "سيتم فحص ظهر المريض لتقييم قدرته على الجلوس والوقوف والمشى ورفع الساقين ويتم تقييم شعوره بالالم على مقياس من صفر لعشرة . سيتم فحص ظهر المريض لتقييم قدرته على الجلوس والوقوف والمشى ورفع الساقين ويتم تقييم شعوره بالالم على مقياس من صفر لعشرة",
              style: TextStyles.regular17(),
            ),
          ],
        ),
      ),
    );
  }
}
