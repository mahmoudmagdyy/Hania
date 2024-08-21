import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/gaps.dart';

class CustomHomeItem extends StatelessWidget {
  const CustomHomeItem({
    super.key, required this.title, required this.image, required this.onTap,
  });
  final String title, image;
  final int visitsNumber = 20 ;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    late AppLocalizations locale = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: const Color(0xffF5F5F5),
        elevation: 2,
        child: Container(
          padding: EdgeInsets.all(16.r),
          height: 150.h,
          width: 150.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                image,
                height: 80.h,
                alignment: locale.isArLocale ? Alignment.centerRight : Alignment.topLeft,
              ),
              Gaps.vGap4,
              Text(
                title.tr,
                style: TextStyles.bold18(),
              ),
              Gaps.vGap4,
              Text(
                '$visitsNumber ${'visit'.tr}',
                style: TextStyles.regular16(
                    color: const Color(0xff1EB7CF)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}