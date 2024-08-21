import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/config/locale/app_localizations.dart';
import '/core/utils/values/assets.dart';
import '/core/utils/values/text_styles.dart';
import '/core/widgets/gaps.dart';

class AboutAppSettingScreen extends StatelessWidget {
  const AboutAppSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: Column(
            children: [
              Gaps.vGap20,
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
                    'about_app'.tr,
                    style: TextStyles.bold16(),
                  ),
                ],
              ),
              Image.asset(Assets.aboutUsImage),
              Gaps.vGap40,
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.tearmsAndCondationTitelSvg,
                  ),
                  Gaps.hGap8,
                  Text(
                    'how_we'.tr,
                    style: TextStyles.bold15(),
                  ),
                ],
              ),
              Gaps.vGap15,
              Text(
                'تطبيق مميز للغاية يساعدك على استخدام جميع الخدمات  حيث يحتوي على العديد من الخدمات ومنها غسيل الملابس وغيرها من الخدمات تطبيق مميز للغاية يساعدك على استخدام جميع خدمات  حيث يحتوي على العديد من الخدمات ومنها غسيل الملابس  وغيرها من الخدمات تطبيق مميز للغاية يساعدك على استخدام جميع خدمات  حيث يحتوي على العديد من الخدمات ومنها غسيل الملابس وغيرها من الخدمات تطبيق مميز للغاية يساعدك على استخدام جميع خدمات  حيث يحتوي على العديد من الخدمات ومنها غسيل الملابس وغيرها من الخدمات تطبيق مميز للغاية يساعدك على استخدام جميع خدمات  حيث يحتوي على العديد من الخدمات ومنها غسيل الملابس وغيرها من الخدمات .',
                style: TextStyles.regular14().copyWith(height: 2),
              ),
              Gaps.vGap30,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const MediaItemWidget(
                    itemImage: Assets.snapchatIconImage,
                  ),
                  Gaps.hGap16,
                  const MediaItemWidget(
                    itemImage: Assets.twitterIconImage,
                  ),
                  Gaps.hGap16,
                  const MediaItemWidget(
                    itemImage: Assets.instegramIconImage,
                  ),
                  Gaps.hGap16,
                  const MediaItemWidget(
                    itemImage: Assets.facebookIconImage,
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

class MediaItemWidget extends StatelessWidget {
  final String itemImage;
  final void Function()? onTap;
  const MediaItemWidget({
    super.key,
    required this.itemImage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        itemImage,
        height: 40.h,
        width: 40.w,
        fit: BoxFit.fill,
      ),
    );
  }
}
