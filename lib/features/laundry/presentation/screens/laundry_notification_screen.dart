import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/config/locale/app_localizations.dart';
import '/core/widgets/gaps.dart';
import '/features/laundry/presentation/widgets/custom_app_bar.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../injection_container.dart';

class LaundryNotificationScreen extends StatefulWidget {
  const LaundryNotificationScreen({super.key});

  @override
  State<LaundryNotificationScreen> createState() =>
      _LaundryNotificationScreenState();
}

class _LaundryNotificationScreenState extends State<LaundryNotificationScreen> {
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    List time = [2, 6];
    List titles = [
      'يوجد لديك طلب جديد الرجاء الرد عليه في اقرب وقت',
      'هناك تحديث جديد للتطبيق يمكنك تثبيته الان'
    ];
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(txt: 'notifications'.tr),
          Gaps.vGap8,
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(titles[index]),
                    Row(
                      children: [
                        Text(
                          '${time[index]}',
                          style: TextStyles.bold18(color: colors.main),
                        ),
                        const Text(' د'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
