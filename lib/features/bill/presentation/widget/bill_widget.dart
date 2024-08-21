import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hania/core/utils/app_colors.dart';

import '../../../../core/utils/svg_manager.dart';
import '../../../../core/utils/values/assets.dart';
import '../../../../core/utils/values/text_styles.dart';

class BillWidget extends StatelessWidget {
   BillWidget({super.key,this.bodyColor});
 final Color ?bodyColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bodyColor?? Colors.white,
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
              title: "كود الزياره",
              value: "H12584",
              image:  SvgPicture.asset(Assets.iconVisitCodeSvg,width: 24,height: 24,),
            ),
            SizedBox(height: 20.h,),
          Row(
            children: [
              Row(
                children: [
                  SvgPicture.asset(SvgAssets.calender_icon,width: 24,height: 24,),
                  const SizedBox(width: 10,),
                  Text("23/2/2024",style:TextStyles.bold18(color: MyColors.iconColor),)
                ],
              ),
              SizedBox(width: 40.w,),
              Row(
                children: [
                  SvgPicture.asset(SvgAssets.iconClock,width: 24,height: 24,),
                  const SizedBox(width: 10,),
                  Text("03:23 pm",style:TextStyles.bold18(color: MyColors.iconColor),)
                ],
              ),
            ],
          ),
            SizedBox(height: 20.h,),
            Row(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(SvgAssets.iconLocation,width: 24,height: 24,),
                    const SizedBox(width: 10,),
                    Text("السعودية - الرياض - طريق الحامول",style:TextStyles.bold18(color: MyColors.iconColor),)
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.h,),
            buildRow(
              image: SvgPicture.asset(Assets.pharmacyStore,width: 24,height: 24,),
              title: "رعاية جروح",
              value: "3 أسابيع",
            ),
          ],
        ),
      ),
    );
  }
  Widget buildRow({title, value,image}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
           image,
            const SizedBox(width: 10,),
            Text(title,style:TextStyles.bold18(color: MyColors.iconColor),)
          ],
        ),
        Text(value,style:TextStyles.bold18(color: MyColors.secondaryColor),),
      ],
    );
  }
}
