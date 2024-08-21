import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/values/assets.dart';
import '../../../../core/widgets/gaps.dart';
import '../../../../injection_container.dart';
import '../../../notifications/presentation/screens/notification_details.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

var formatter = NumberFormat('#,###,000');

List titles = ['اضافة كاش باك', 'خصم كوبون', 'تفعيل كود خصم'];
List details = [
  'حصلت على كاش باك بقيمة 20 جنيهاً بعد استخدامك البرومو كود',
  'حصلت على خصم 10%  على الفاتورة بعد استخدام كود الخصم',
  'تم تفعيل كود الخصم الخاص بك'
];

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F8FA),
      child: Column(children: [
        topContainer(),
        Center(
          child: Text(
            'المعاملات السابقة',
            style: theme.titleMedium,
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        transactions()
      ]),
    );
  }

  topContainer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            Assets.iconsBell,
            height: 200.h,
          ),
          Text(
            formatter.format(500000),
            style: theme.displayMedium,
          )
        ],
      ),
    );
  }

  transactions() {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        separatorBuilder: (context, index) => SizedBox(
          height: 16.h,
        ),
        itemCount: 3,
        itemBuilder: (context, index) => Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formatter.format(7800),
                    style: theme.bodyLarge,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.r),
                        color: colors.dividerColor.withOpacity(0.2),
                        child: Text('خدمة',
                            style: theme.bodyMedium!.copyWith(
                              color: colors.dividerColor,
                            )),
                      ),
                      Gaps.hGap8,
                      const Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ],
              ),
              Gaps.vGap8,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: ScreenUtil().screenWidth * 0.15,
                        child: Image.asset(
                          Assets.iconsBell,
                        ),
                      ),
                      Gaps.hGap16,
                      SizedBox(
                        width: ScreenUtil().screenWidth * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(titles[index]),
                            Gaps.vGap8,
                            Text(
                              details[index],
                              style: theme.bodySmall!
                                  .copyWith(color: colors.highlight),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Gaps.vGap8,
                            Text(
                              '25/5/2023  6:32 Pm',
                              style: theme.bodySmall!
                                  .copyWith(color: colors.highlight),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
