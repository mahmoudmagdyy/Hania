import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/core/utils/values/assets.dart';
import '/core/utils/values/text_styles.dart';
import '/core/widgets/gaps.dart';
import '/injection_container.dart';

class NotificationItemWidget extends StatelessWidget {
  final String itemTitel;
  final String itemDetails;
  const NotificationItemWidget(
      {super.key, required this.itemTitel, required this.itemDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      padding: EdgeInsets.only(
        right: 29.w,
        top: 10.h,
        bottom: 14.h,
        left: 70.w,
      ),
      decoration: BoxDecoration(
        color: colors.buttonColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: colors.buttonColor),
      ),
      child: Row(
        children: [
          Image.asset(
            Assets.notificationLogoItemImage,
            height: 50.h,
            width: 50.w,
            fit: BoxFit.fill,
          ),
          Gaps.hGap10,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemTitel,
                  style: TextStyles.bold14(color: colors.buttonColor),
                ),
                Gaps.vGap10,
                Text(
                  itemDetails,
                  style: TextStyles.bold12(color: colors.buttonColor),
                  maxLines: 3,
                  overflow: TextOverflow.fade,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
