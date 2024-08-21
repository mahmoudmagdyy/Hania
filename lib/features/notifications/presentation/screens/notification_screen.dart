import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/core/utils/values/assets.dart';
import '/core/utils/values/text_styles.dart';
import '/core/widgets/gaps.dart';
import '/features/notifications/presentation/widget/dropdown_notifcation_widget.dart';
import '/features/notifications/presentation/widget/notifaction_item_widget.dart';
import '../../../../config/locale/app_localizations.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

late AppLocalizations locale;
late TextTheme theme;
List titles = ['عروض خاصة', 'حساب جديد'];
List details = [
  'عروض خاصة وخصومات كبيرة على جميع المنتجات تصل الى 50% ',
  'هناك العديد من المميزات التى ستجدها اخبرنا برايك'
];

class _NotificationScreenState extends State<NotificationScreen> {
  static const List<Widget> items = [
    NotificationItemWidget(
      itemTitel: 'يتم هنا وضع عنوان الإشعار',
      itemDetails: 'يتم هنا كتابة محتوى الإشعار المراد',
    ),
    NotificationItemWidget(
      itemTitel: 'يتم هنا وضع عنوان الإشعار',
      itemDetails: 'يتم هنا كتابة محتوى الإشعار المراد',
    ),
    NotificationItemWidget(
      itemTitel: 'يتم هنا وضع عنوان الإشعار',
      itemDetails: 'يتم هنا كتابة محتوى الإشعار المراد',
    ),
    NotificationItemWidget(
      itemTitel: 'يتم هنا وضع عنوان الإشعار',
      itemDetails: 'يتم هنا كتابة محتوى الإشعار المراد',
    ),
    NotificationItemWidget(
      itemTitel: 'يتم هنا وضع عنوان الإشعار',
      itemDetails: 'يتم هنا كتابة محتوى الإشعار المراد',
    ),
    NotificationItemWidget(
      itemTitel: 'يتم هنا وضع عنوان الإشعار',
      itemDetails: 'يتم هنا كتابة محتوى الإشعار المراد',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   centerTitle: true,
      //   actions: const [],
      //   title: Text(
      //     'notifications'.tr,
      //     style: TextStyles.bold16(),
      //   ),
      // ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Gaps.vGap20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        'notifications'.tr,
                        style: TextStyles.bold16(),
                      ),
                    ],
                  ),
                  DropdownNotifcationWiget(
                    onChanged: (value) {
                      if (value == 1) {
                      } else if (value == 2) {
                        setState(() {
                          items.clear();
                        });
                      }
                    },
                  )
                ],
              ),
              Gaps.vGap10,
              // const NotFoundNotifcationWidget(),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => Gaps.vGap18,
                  itemCount: items.length,
                  itemBuilder: ((context, index) => items[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotFoundNotifcationWidget extends StatelessWidget {
  const NotFoundNotifcationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Assets.notFoundNotificationImage),
        Text(
          'not_found_notification'.tr,
          style: TextStyles.bold16(),
        )
      ],
    );
  }
}
