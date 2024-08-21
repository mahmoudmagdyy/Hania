import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hania/config/locale/app_localizations.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/values/text_styles.dart';

class InvoiceCard extends StatelessWidget {
  const InvoiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            width: 1,
            color: Colors.grey,
          )
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
                width: 90.h,
                height: 80.h,
                decoration: BoxDecoration(
                  color: MyColors.grayLight,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("23",style:TextStyles.bold18(),),
                  Text("Feb,2023",style:TextStyles.regular16(),),
                ],
              ),
            ),
            SizedBox(width:13.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildRow(
                  title: "كود الزيارة",
                  value: "H125855",
                ),
                buildRow(
                  title: "3000 ريال",
                  value: "1000 ريال",
                 colorVlaue:Colors.red,
                ),


              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget buildRow({title, value,colorVlaue}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style:TextStyles.bold18(),),
        SizedBox(width:100.w),
        Text(value,style:TextStyles.bold18(color:colorVlaue?? MyColors.black),),
      ],
    );
  }
}
