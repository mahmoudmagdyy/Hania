import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../injection_container.dart';
import '/core/utils/values/text_styles.dart';
import '/core/widgets/gaps.dart';

class UserTypeItemWidget extends StatelessWidget {
  final String itemImage;
  final String itemType;
  final double? imageWidth;
  final double? imageHeight;
  final void Function()? onTap;
  const UserTypeItemWidget({
    super.key,
    required this.itemImage,
    required this.itemType,
    this.imageWidth,
    this.imageHeight,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 190.w,
        padding: EdgeInsets.only(
          right: 44.w,
          left: 44.w,
          bottom: 24.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: colors.onBoardingColor.withOpacity(.2),
        ),
        child: Column(
          children: [
            Image.asset(
              itemImage,
              width: imageWidth,
              height: imageHeight,
            ),
            Gaps.vGap20,
            Text(
              itemType,
              style: TextStyles.bold15(),
            ),
          ],
        ),
      ),
    );
  }
}