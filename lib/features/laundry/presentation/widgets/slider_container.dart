import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/core/widgets/gaps.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../injection_container.dart';

class SliderContainer extends StatelessWidget {
  const SliderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    List items = [colors.borderColor, colors.main, colors.review];
    return CarouselSlider(
        items: items.map((color) {
          return Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.all(4.r),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Container(
              padding: EdgeInsets.all(8.r),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.generating_tokens),
                          Gaps.hGap8,
                          Text(
                            'الأرباح هذا الشهر',
                            style: TextStyles.regular12(),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: colors.review,
                        ),
                        child: const Text('+ 17 %'),
                      )
                    ],
                  ),
                  Gaps.vGap16,
                  Row(
                    children: [
                      Text('65,555', style: TextStyles.regular28()),
                      Text(' ريال ',
                          style: TextStyles.regular14(
                              color: colors.main.withOpacity(0.5)))
                    ],
                  ),
                ],
              ),
            ),
          );
        }).toList(),
        options: CarouselOptions(
          height: 140.h,
          viewportFraction: 0.6,
        ));
  }
}
