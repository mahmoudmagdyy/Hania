import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/config/locale/app_localizations.dart';
import '/config/routes/app_routes.dart';
import '/core/utils/values/assets.dart';
import '/core/utils/values/text_styles.dart';
import '/core/widgets/gaps.dart';
import '/features/profile/presentation/screens/setting/botton_sheet_method.dart';
import '../../widgets/profile_widget/profile_item_widget.dart';
import '/features/profile/presentation/widgets/setting/language_setting_widget.dart';
import '/features/profile/presentation/widgets/setting/mode_bottom_sheet_widget.dart';
import '/features/profile/presentation/widgets/setting/rate_app_setting_widget.dart';
import '/injection_container.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              Gaps.vGap22,
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 25.r,
                    ),
                  ),
                  Gaps.hGap10,
                  Text(
                    'settings'.tr,
                    style: TextStyles.bold16(),
                  ),
                ],
              ),
              Gaps.vGap60,
              ProfileItemWidget(
                itemName: 'about_app'.tr,
                itemImage: Assets.aboutAppIconSvg,
                onTap: () {
                  Navigator.pushNamed(context, Routes.aboutUsRoute);
                },
                showArrow: true,isSvg: true,
              ),
              ProfileItemWidget(
                itemName: 'terms_and_conditions'.tr,
                itemImage: Assets.tearmsAndCondationsIconSvg,
                onTap: () {
                  Navigator.pushNamed(context, Routes.privacyPolicyRoute);
                },
                showArrow: true,isSvg: true,
              ),
              ProfileItemWidget(
                itemName: 'public_quation'.tr,
                itemImage: Assets.publicQuationIconSvg,
                onTap: () {
                  Navigator.pushNamed(context, Routes.publucQuationRoute);
                },
                showArrow: true,isSvg: true,
              ),
              ProfileItemWidget(
                itemName: 'rank_app'.tr,
                itemImage: Assets.rateIconSvg,
                onTap: () {
                  amrShowBottomSheet(
                    context: context,
                    body: const RateAppSettingWidget(),
                  );
                },
                showArrow: true,isSvg: true,
              ),
              ProfileItemWidget(
                itemName: 'language'.tr,
                itemImage: Assets.langIconSvg,
                onTap: () {
                  amrShowBottomSheet(
                    context: context,
                    body: const LanguageSettingWidget(),
                  );
                },
                showArrow: true,isSvg: true,
              ),
              ProfileItemWidget(
                itemName: 'change_mode'.tr,
                itemImage: Assets.changeModeIconSvg,
                onTap: () {
                  amrShowBottomSheet(
                    context: context,
                    body: const ModeBottomSheetWidget(),
                  );
                },
                showArrow: true,isSvg: true,
              ),
              ProfileItemWidget(isSvg: true,
                itemName: 'logout'.tr,
                itemImage: Assets.logOutIconSvg,
                onTap: () {
                  displayLogoutDialog(
                    context: context,
                    alerTitel: 'sure_message'.tr,
                    alertContent: 'message_quation'.tr,
                    alertContent_2: 'message_details'.tr,
                  );
                },
                showArrow: false,
                imageColorFilter: colors.errorColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
