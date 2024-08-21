import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/config/locale/app_localizations.dart';
import '/core/utils/values/text_styles.dart';
import '/core/widgets/gaps.dart';
import '/features/auth/data/models/welcome_model.dart';
import '/injection_container.dart';

class MyPageView extends StatelessWidget {
  final int index;
  final WelcomeData page;

  const MyPageView({super.key, required this.index, required this.page});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Align(
        //   // alignment: AppLocalizations.of(context)!.isEnLocale
        //   //     ? Alignment.centerRight
        //   //     : Alignment.centerLeft,
        //   alignment: Alignment.centerLeft,
        //   child: Image.asset(
        //     Assets.onBoardingOneBackGroundImage,
        //     fit: BoxFit.fitHeight,
        //   ),
        // ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Gaps.vGap60,
              Image.asset(page.image ?? ''),
              Gaps.vGap25,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'onBoarding_title_1'.tr,
                          style: TextStyles.bold30().copyWith(
                            fontWeight: FontWeight.w800,
                            color: colors.main,
                          ),
                        ),
                        Text(
                          'onBoarding_title_2'.tr,
                          style: TextStyles.bold30().copyWith(
                            fontWeight: FontWeight.w800,
                            color: colors.main,
                          ),
                        ),
                        Gaps.vGap22,
                        Padding(
                          padding: EdgeInsets.only(
                            right: 155.w,
                          ),
                          child: Text(
                            'onBoarding_details'.tr,
                            style: TextStyles.bold20(),
                          ),
                        )
                      ],
                    ),
                  ),
                  Gaps.hGap10,
                  _buildDots(context: context, currentIndex: index),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  SizedBox _buildDots(
      {required int currentIndex, required BuildContext context}) {
    return SizedBox(
      child: Column(
        children: [
          _buildDot(currentIndex == 0, context),
          Gaps.vGap25,
          _buildDot(currentIndex == 1, context),
          Gaps.vGap25,
          _buildDot(currentIndex == 2, context),
        ],
      ),
    );
  }

  _buildDot(bool isSelected, BuildContext context) {
    return isSelected
        ? Container(
            width: 15.w,
            height: 15.h,
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              color: colors.main,
              shape: BoxShape.circle,
            ),
          )
        : Container(
            width: 15.w,
            height: 15.h,
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: const BoxDecoration(
              color: Color(0xffE0E0E0),
              shape: BoxShape.circle,
            ),
          );
  }
}
