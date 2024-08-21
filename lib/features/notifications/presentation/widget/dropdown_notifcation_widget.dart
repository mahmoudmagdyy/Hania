import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '/config/locale/app_localizations.dart';
import '/core/utils/values/assets.dart';
import '/core/utils/values/text_styles.dart';
import '/injection_container.dart';

class DropdownNotifcationWiget extends StatelessWidget {
  final void Function(int?) onChanged;
  const DropdownNotifcationWiget({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          // icon: SvgPicture.asset(Assets.menuLogoSvg),
          hint: const SizedBox(
            width: 0,
          ),
          onChanged: (value) {},
          isExpanded: false,

          icon: SvgPicture.asset(Assets.menuLogoSvg),

          menuMaxHeight: 100.h,
          //width: 171.w,

          borderRadius: BorderRadius.circular(15.r),
          // padding: EdgeInsets.all(16.r),

          items: [
            DropdownMenuItem<int>(
              value: 1,
              child: Text(
                'mute_notification'.tr,
                style: TextStyles.bold12(
                  color: colors.buttonColor,
                ),
              ),
            ),
            DropdownMenuItem<int>(
              value: 2,
              child: Text(
                'delete_notification'.tr,
                style: TextStyles.bold12(
                  color: colors.buttonColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
