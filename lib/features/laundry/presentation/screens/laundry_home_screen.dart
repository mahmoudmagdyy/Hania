import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '/config/locale/app_localizations.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/svg_manager.dart';
import '../../../../core/utils/values/assets.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/gaps.dart';
import '../../../../injection_container.dart';
import '../widgets/home_loundary_options_container.dart';
import '../widgets/slider_container.dart';

class LaundryHomeScreen extends StatelessWidget {
  LaundryHomeScreen({super.key});

  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.laundryAddServiceScreenRoute);
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
            decoration: BoxDecoration(
              color: const Color(0xffD6F0FC),
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        Text(
                          'أهلاً بك .......',
                          style: TextStyles.regular16(color: Colors.black),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'تطبيقنا المميز ',
                            style: TextStyles.bold20(color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'مغسول',
                                  style: TextStyles.bold20(color: colors.main)),
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 3.r,
                            //bottom: 4.r,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: const Color(0xffEEEEEE),
                            ),
                            padding: EdgeInsets.all(16.r),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context,
                                    Routes.laundryNotificationScreenRoute);
                              },
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  SvgPicture.asset(SvgAssets.notification),
                                  CircleAvatar(
                                    radius: 8.r,
                                    backgroundColor: const Color(0xffD61842),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Gaps.vGap20,
              ],
            ),
          ),
          Gaps.vGap20,
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              children: [
                const SliderContainer(),
                Gaps.vGap16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HomeLaundryOptionsContainer(
                      image: Image.asset(Assets.orders),
                      title: 'orders'.tr,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.laundryServicesScreenRoute);
                      },
                      child: HomeLaundryOptionsContainer(
                        image: Image.asset(Assets.services),
                        title: 'services'.tr,
                      ),
                    ),
                  ],
                ),
                Gaps.vGap16,
                Container(
                  height: 140.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  decoration: BoxDecoration(
                    color: colors.upBackGround,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildMainRow(txt: 'newOrders'.tr, count: 2),
                      Gaps.vGap8,
                      _buildMainRow(txt: 'currentOrders'.tr, count: 5),
                      Gaps.vGap8,
                      _buildMainRow(txt: 'completedOrders'.tr, count: 422),
                      Gaps.vGap8,
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
            color: colors.upBackGround,
          ))
        ],
      ),
    );
  }

  _buildMainRow({required String txt, count}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          txt,
          style: TextStyles.regular14(color: const Color(0xff1F1F1F)),
        ),
        Row(
          children: [
            Text(
              '$count',
              style: TextStyles.bold18(color: colors.main),
            ),
            Text(
              'order'.tr,
              style: TextStyles.regular14(color: const Color(0xff1F1F1F)),
            ),
          ],
        ),
      ],
    );
  }
}
