import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hania/config/locale/app_localizations.dart';
import 'package:hania/core/utils/app_colors.dart';

import '../../../../core/utils/svg_manager.dart';
import '../../../../core/utils/values/assets.dart';
import '../../../../core/utils/values/text_styles.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({super.key,});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: MyColors.grayLight,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            width: 1,
            color: Colors.grey,
          )
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildRow(
              title: "total_amount2".tr,
              value: "3000 ريال",
            ),
           Divider(),
            buildRow(
              title: "paid_amount".tr,
              value: "3000 ريال",
            ),
            Divider(),
            buildRow(
              title: "number_installments".tr,
              value: "0 أقساط",
            ),
           Divider(),
            buildRow(
              title: "remaining_amount".tr,
              value: "0 ريال",
            ),

          ],
        ),
      ),
    );
  }
  Widget buildRow({title, value}){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style:TextStyles.bold18(),),
          Text(value,style:TextStyles.bold18(color: MyColors.iconColor),),
        ],
      ),
    );
  }
}
