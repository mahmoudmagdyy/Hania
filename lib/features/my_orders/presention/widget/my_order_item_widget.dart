import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '/core/utils/values/assets.dart';
import '/core/utils/values/text_styles.dart';
import '/core/widgets/gaps.dart';
import '/injection_container.dart';

class MyOrderItemWidget extends StatelessWidget {
  final String itemID;
  final String itemDetails;
  final void Function()? onTap;
  final String itemDate;
  final String itemTime;
  final String itemBrache;
  final String itemStatus;
  final Color statusColor;
  const MyOrderItemWidget({
    super.key,
    required this.itemID,
    this.onTap,
    required this.itemDate,
    required this.itemTime,
    required this.itemBrache,
    required this.itemStatus,
    required this.itemDetails,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: colors.buttonColor2.withOpacity(.99),
      child: Container(
        height: 150.h,
        padding: EdgeInsets.symmetric(
          vertical: 16.h,
          horizontal: 12.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  itemID,
                  style: TextStyles.regular18(color: colors.main),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    itemDetails,
                    style: TextStyles.regular18(color: colors.main),
                  ),
                ),
              ],
            ),
            Gaps.vGap16,
            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        size: 20.r,
                      ),
                      Gaps.hGap8,
                      Text(
                        itemDate,
                        style: TextStyles.regular14(),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.watch_later_outlined,
                        size: 20.r,
                      ),
                      Gaps.hGap8,
                      Text(
                        itemTime,
                        style: TextStyles.regular14(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Gaps.vGap16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      Assets.locationIconSvg,
                    ),
                    Gaps.hGap8,
                    Text(
                      itemBrache,
                      style: TextStyles.regular14(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: statusColor,
                      radius: 7.r,
                    ),
                    Gaps.hGap8,
                    Text(
                      itemStatus,
                      style: TextStyles.regular10(),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
