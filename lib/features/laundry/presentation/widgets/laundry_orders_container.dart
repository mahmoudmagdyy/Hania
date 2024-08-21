import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/values/text_styles.dart';
import '../../../../injection_container.dart';

class LaundryOrdersContainer extends StatelessWidget {
  const LaundryOrdersContainer(
      {super.key,
      required this.id,
      required this.date,
      required this.time,
      required this.address,
      required this.type});
  final String id, date, time, address, type;
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
          color: colors.upBackGround,
          border: Border.all(color: colors.borderColor),
          borderRadius: BorderRadius.circular(15.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  id,
                  style: TextStyles.bold20(),
                ),
                Text(
                  "details",
                  style: TextStyles.bold20(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: TextStyles.bold20(),
                ),
                Text(
                  time,
                  style: TextStyles.bold20(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(type),
                    Container(
                      height: 20.r,
                      width: 20.r,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          color: (type == 'current')
                              ? colors.review
                              : (type == 'finished')
                                  ? colors.main
                                  : colors.errorColor),
                    )
                  ],
                ),
                Text(address)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
