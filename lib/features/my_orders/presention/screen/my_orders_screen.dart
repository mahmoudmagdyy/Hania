import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/config/locale/app_localizations.dart';
import '/core/utils/values/text_styles.dart';
import '/core/widgets/gaps.dart';
import '/core/widgets/my_default_button.dart';
import '/features/my_orders/presention/widget/my_order_item_widget.dart';
import '/injection_container.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  num isSelect = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Gaps.vGap20,
              Row(
                children: [
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.pop(context);
                  //   },
                  //   child: Icon(
                  //     Icons.arrow_back,
                  //     size: 30.r,
                  //   ),
                  // ),
                  Gaps.hGap20,
                  Text(
                    'my_orders'.tr,
                    style: TextStyles.bold16(),
                  ),
                ],
              ),
              Gaps.vGap40,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyDefaultButton(
                    onPressed: () {
                      setState(() {
                        isSelect = 1;
                      });
                    },
                    btnText: 'current_button',
                    width: 125.w,
                    height: 45.h,
                    borderRadius: 16.r,
                    color: isSelect == 1 ? colors.main : colors.buttonColor2,
                    borderColor:
                        isSelect == 1 ? colors.main : colors.buttonColor2,
                    textColor: isSelect == 1 ? colors.baseColor : colors.body,
                  ),
                  MyDefaultButton(
                    onPressed: () {
                      setState(() {
                        isSelect = 2;
                      });
                    },
                    btnText: 'completed_button',
                    width: 125.w,
                    height: 45.h,
                    borderRadius: 16.r,
                    color: isSelect == 2 ? colors.main : colors.buttonColor2,
                    borderColor:
                        isSelect == 2 ? colors.main : colors.buttonColor2,
                    textColor: isSelect == 2 ? colors.baseColor : colors.body,
                  ),
                  MyDefaultButton(
                    onPressed: () {
                      setState(() {
                        isSelect = 3;
                      });
                    },
                    btnText: 'canceled_button',
                    width: 125.w,
                    height: 45.h,
                    borderRadius: 16.r,
                    color: isSelect == 3 ? colors.main : colors.buttonColor2,
                    borderColor:
                        isSelect == 3 ? colors.main : colors.buttonColor2,
                    textColor: isSelect == 3 ? colors.baseColor : colors.body,
                  ),
                ],
              ),
              Gaps.vGap25,
              isSelect == 0
                  ? const SizedBox()
                  : Column(
                      children: [
                        MyOrderItemWidget(
                          itemID: '#31212',
                          itemDetails: 'betails'.tr,
                          itemDate: '2023-08-12',
                          itemTime: '16:40',
                          itemBrache: 'الرياض , شارع نعيم بن حمد',
                          itemStatus: isSelect == 1
                              ? 'waiting_order'.tr
                              : isSelect == 2
                                  ? 'complete_order'.tr
                                  : isSelect == 3
                                      ? 'cancelled_order'.tr
                                      : '',
                          statusColor: isSelect == 1
                              ? Colors.yellow
                              : isSelect == 2
                                  ? Colors.green
                                  : isSelect == 3
                                      ? colors.errorColor
                                      : colors.main,
                        ),
                        Gaps.vGap16,
                        MyOrderItemWidget(
                          itemID: '#26585',
                          itemDetails: 'betails'.tr,
                          itemDate: '2023-08-12',
                          itemTime: '09:16',
                          itemBrache: 'الرياض , ابي بكر الرازي',
                          itemStatus: isSelect == 1
                              ? 'waiting_order'.tr
                              : isSelect == 2
                                  ? 'complete_order'.tr
                                  : isSelect == 3
                                      ? 'cancelled_order'.tr
                                      : '',
                          statusColor: isSelect == 1
                              ? Colors.yellow
                              : isSelect == 2
                                  ? Colors.green
                                  : isSelect == 3
                                      ? colors.errorColor
                                      : colors.main,
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
