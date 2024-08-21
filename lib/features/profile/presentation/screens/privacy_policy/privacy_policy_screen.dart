import '/config/locale/app_localizations.dart';
import '/core/utils/values/assets.dart';
import '/core/utils/values/text_styles.dart';
import '/core/widgets/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            right: 21.w,
            left: 25.w,
          ),
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
                    'terms_and_conditions'.tr,
                    style: TextStyles.bold18(),
                  ),
                ],
              ),
              Image.asset(Assets.tearmsAndCondationImage),
              Gaps.vGap40,
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.tearmsAndCondationTitelSvg,
                  ),
                  Gaps.hGap8,
                  Text(
                    'terms_and_conditions'.tr,
                    style: TextStyles.bold18(),
                  ),
                ],
              ),
              Gaps.vGap15,
              Text(
                'تطبيق مميز للغاية يساعدك على استخدام جميع الخدمات  حيث يحتوي على العديد من الخدمات ومنها غسيل الملابس وغيرها من الخدمات تطبيق مميز للغاية يساعدك على استخدام جميع خدمات  حيث يحتوي على العديد من الخدمات ومنها غسيل الملابس  وغيرها من الخدمات تطبيق مميز للغاية يساعدك على استخدام جميع خدمات  حيث يحتوي على العديد من الخدمات ومنها غسيل الملابس وغيرها من الخدمات تطبيق مميز للغاية يساعدك على استخدام جميع خدمات  حيث يحتوي على العديد من الخدمات ومنها غسيل الملابس وغيرها من الخدمات تطبيق مميز للغاية يساعدك على استخدام جميع خدمات  حيث يحتوي على العديد من الخدمات ومنها غسيل الملابس وغيرها من الخدمات .',
                style: TextStyles.regular14().copyWith(height: 2),
              ),
              // ListView.separated(
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   itemCount: 5,
              //   separatorBuilder: (context, index) => Gaps.vGap8,
              //   itemBuilder: (context, index) {
              //     return Text(
              //       'condion_tearms_1'.tr,
              //       style: TextStyles.regular16().copyWith(height: 2),
              //     );
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
}
