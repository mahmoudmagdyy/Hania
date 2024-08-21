import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/values/assets.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../injection_container.dart';

class ServiceContainer extends StatelessWidget {
  const ServiceContainer(
      {super.key, required this.title, this.color, this.icon, this.hasIcon});
  final String title;
  final Color? color;
  final bool? hasIcon;
  final Image? icon;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: (color == null) ? colors.upBackGround : color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      child: Container(
        width: (ScreenUtil().screenWidth * 0.5) - 24,
        height: 60.h,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
        child: Row(
          children: [
            (hasIcon == true)
                ? SizedBox(
                    width: 30.w,
                    child: Image.asset(
                      Assets.services,
                      height: 30.h,
                      fit: BoxFit.fill,
                    ))
                : const SizedBox(),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: TextStyles.regular12(
                      color: (color != null) ? colors.upBackGround : null),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
