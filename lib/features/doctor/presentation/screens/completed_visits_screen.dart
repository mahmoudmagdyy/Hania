import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hania/config/locale/app_localizations.dart';
import 'package:hania/core/utils/app_colors.dart';
import 'package:hania/core/utils/values/assets.dart';
import 'package:hania/core/utils/values/text_styles.dart';
import 'package:hania/core/widgets/gaps.dart';
import 'package:hania/features/doctor/presentation/widgets/custom_row_item.dart';

import '../../../../config/routes/app_routes.dart';
class CompletedVisitsScreen extends StatelessWidget {
  const CompletedVisitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(21.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 30.r,
                    ),
                  ),
                  Gaps.hGap10,
                  Text(
                    'done_visits'.tr,
                    style: TextStyles.bold20(),
                  ),
                ],
              ),
              Gaps.vGap12,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("from".tr, style: TextStyles.bold20().copyWith(color: MyColors.main)),
                      Container(
                          height: 40.h,
                          width: 180.w,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: const Color(0xff939393), width: 1.w),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('6/2/2024' , style: TextStyles.regular16().copyWith(color: const Color(0xff939393),),),
                              SvgPicture.asset(Assets.iconDateSvg)
                            ],
                          )

                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("to".tr, style: TextStyles.bold20().copyWith(color: MyColors.main)),
                      Container(
                          height: 40.h,
                          width: 180.w,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: const Color(0xff939393), width: 1.w),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('6/2/2024' , style: TextStyles.regular16().copyWith(color: const Color(0xff939393),),),
                              SvgPicture.asset(Assets.iconDateSvg)
                            ],
                          )

                      ),
                    ],
                  ),
                ],
              ),
              Gaps.vGap20,
              Expanded(
                child: ListView.separated(
                  itemCount: 5,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      GestureDetector(
                        onTap: ()=> Navigator.pushNamed(context, Routes.visitDetailsScreenRoute),
                        child: Container(
                                            width: double.infinity,
                                            padding: EdgeInsets.all(16.r),
                                            decoration: BoxDecoration(
                        color: MyColors.backGround,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: const Color(0xffDADADA), width: 1.w),
                                            ),
                                            child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomItemRow(image: Assets.iconVisitCodeSvg, title: 'visit_code'.tr,),
                              Text(
                                'H123456',
                                style: TextStyles.bold18().copyWith(color: const Color(0xff1EB7CF)),
                              ),
                            ],
                          ),
                          Gaps.vGap20,
                          Row(
                            children: [
                              const CustomItemRow(title: "23/2/2024", image: Assets.iconDateSvg),
                              Gaps.hGap70,
                              const CustomItemRow(title: "03:23 pm", image: Assets.iconClockSvg),
                            ],
                          ),
                          Gaps.vGap20,
                          const CustomItemRow(title: 'السعودية - الرياض - طريق الحامول', image: Assets.iconLocationSvg),
                        ],
                                            ),
                                          ),
                      ),
                  separatorBuilder: (context, index) => Gaps.vGap20,
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
