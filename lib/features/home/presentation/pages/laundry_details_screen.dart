import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/config/routes/app_routes.dart';
import '/core/utils/svg_manager.dart';
import '../../../../core/utils/values/assets.dart';
import '../../../../core/utils/values/strings.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../../../../core/widgets/gaps.dart';
import '../../../../injection_container.dart';

class LaundryDetailsScreen extends StatefulWidget {
  const LaundryDetailsScreen({super.key});

  @override
  State<LaundryDetailsScreen> createState() => _LaundryDetailsScreenState();
}

List<int> selected = [];

class _LaundryDetailsScreenState extends State<LaundryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل المغسلة'),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 222.h,
                width: 402.w,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      width: double.infinity,
                      //height: 51.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Image.asset(
                        Assets.laundry,
                        // height: 89,
                        // width: 131,
                        // fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r)),
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 12.r, right: 12.r, top: 5.r, bottom: 5.r),
                          //color: Colors.black,
                          // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
                          width: 302.w,

                          height: 91.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'مغسلة الإيمان',
                                style: TextStyles.bold14(),
                              ),
                              Gaps.vGap8,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_rounded,
                                        color: colors.body,
                                        size: 14.r,
                                      ),
                                      Text(
                                        '500 م',
                                        style: TextStyles.regular12(),
                                      )
                                    ],
                                  ),
                                  Gaps.hGap4,
                                  Row(
                                    children: [
                                      Icon(Icons.bookmarks_outlined,
                                          size: 14.r, color: colors.main),
                                      Text(
                                        '250 ر.س',
                                        style: TextStyles.regular12(
                                            color: colors.main),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Gaps.vGap8,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_rounded,
                                        color: colors.body,
                                        size: 14.r,
                                      ),
                                      Text(
                                        '500 م',
                                        style: TextStyles.regular12(),
                                      )
                                    ],
                                  ),
                                  Gaps.hGap4,
                                  Row(
                                    children: [
                                      Icon(Icons.bookmarks_outlined,
                                          size: 14.r, color: colors.main),
                                      Text(
                                        'شارع عبدالعزيز السلطان',
                                        style: TextStyles.regular12(
                                            color: colors.main),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Gaps.vGap16,
              Text(
                'التفاصيل :',
                style: TextStyles.bold14(),
                textAlign: TextAlign.start,
              ),
              Gaps.vGap8,
              Text(
                ' مغسلة تهتم بتقديم خدمات متعددة من التنظيف ، الصباغة ، التبييض ، إزالة البقع ، تلميع وتنظيف جاف. حيث يعتبر تزامن التغير السريع.في الاتجاه من الغسيل الفردي إلى خدمات الغسيل التجارية مع التغير التكنولوجي في العصر الحالى تقوم المغسلة بتوفير الوقت والجهد للعملاء وحماية أنواع الملابس والحفاظ على جودة النسيج من خلال الخبرة من خلال الخبرة في معرفة أنواع الأقمشة واستخدام الطريقة المناسبة لتجنب إتلاف الملابستقوم المغسلة بتوفير الوقت والجهد للعملاء وحماية أنواع الملابس والحفاظ على جودة النسيج من خلال الخبرة في معرفة أنواع الأقمشة ',
                style: TextStyles.regular12(),
              ),
              Gaps.vGap30,
              Divider(
                color: colors.dividerColor,
                thickness: 1,
              ),
              Gaps.vGap16,
              Text(
                'الخدمات :',
                style: TextStyles.bold14(),
                textAlign: TextAlign.start,
              ),
              Gaps.vGap16,
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 2),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      if (selected.contains(index)) {
                        selected.remove(index);
                      } else {
                        selected.add(index);
                      }
                    });
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 200,
                      ),
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: selected.contains(index)
                                ? colors.main
                                : colors.backGround,
                          ),
                          padding: EdgeInsets.all(4.r),
                          //height: 20.h,
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(4.r),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    color: selected.contains(index)
                                        ? const Color(0xffD9F2FF)
                                        : const Color(0xffF6F6F6)),
                                child: SvgPicture.asset(SvgAssets.laundryIcon),
                              ),
                              Gaps.hGap4,
                              Text(
                                'صباغة الملابس',
                                style: TextStyles.bold14(),
                              )
                            ],
                          ),
                        ),
                      ),
                      selected.contains(index)
                          ? Positioned(
                              left: 0,
                              top: 0,
                              child: Card(
                                elevation: 2,
                                color: Colors.white,
                                shape: const CircleBorder(),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Icon(
                                    Icons.check,
                                    color: colors.main,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
              Gaps.vGap16,
              AppElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.orderScreenRoute);
                },
                text: Strings.orderNow,
                buttonRadius: 10.r,
              )
            ],
          ),
        ),
      ),
    );
  }
}
