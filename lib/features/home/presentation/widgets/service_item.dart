import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hania/config/locale/app_localizations.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/gaps.dart';
import '../../../../injection_container.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 217.h,
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: colors.secondaryColor.withOpacity(.2),
      ),
      child: Column(
        children: [
          CircleAvatar(
              radius: 40.r,
              backgroundColor: colors.secondaryColor,
              child: Padding(
                padding: EdgeInsets.all(2.0.r),
                child: CircleAvatar(
                  radius: 38.r,
                  backgroundColor: colors.main,
                ),
              )),

          Text('خدمات التمريض',style: TextStyles.bold18(),),
          Text('1000 ريال',style: TextStyles.regular16(color: colors.secondaryColor),),
          Gaps.vGap8,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.r),
              color: colors.main,
            ),
            child: Text('order_the_service'.tr,style: TextStyles.regular16(color: colors.backGround),),
          )

        ],
      ),
    );
  }
}
