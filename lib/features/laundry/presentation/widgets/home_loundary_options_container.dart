import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/gaps.dart';
import '../../../../injection_container.dart';

class HomeLaundryOptionsContainer extends StatelessWidget {
  const HomeLaundryOptionsContainer(
      {super.key, required this.image, required this.title});
  final Widget image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        width: 150.w,
        height: 140.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: colors.upBackGround,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image,
            Gaps.vGap8,
            Text(
              title,
              style: TextStyles.bold18(),
            )
          ],
        ),
      ),
    );
  }
}
