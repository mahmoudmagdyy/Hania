import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/config/locale/app_localizations.dart';
import '/config/routes/app_routes.dart';
import '/core/utils/values/assets.dart';
import '/core/utils/values/text_styles.dart';
import '/core/widgets/gaps.dart';
import '/injection_container.dart';

class CallCenterScreen extends StatefulWidget {
  const CallCenterScreen({super.key});

  @override
  State<CallCenterScreen> createState() => _CallCenterScreenState();
}

class _CallCenterScreenState extends State<CallCenterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                    'helper'.tr,
                    style: TextStyles.bold16(),
                  ),
                ],
              ),
              Gaps.vGap60,
              Image.asset(
                Assets.helperImage,
                height: 241.h,
                width: 270.w,
                fit: BoxFit.fill,
              ),
              Gaps.vGap35,
              CallCenterItemWidget(
                itemName: 'public_quation',
                onTap: () {
                  Navigator.pushNamed(context, Routes.publucQuationRoute);
                },
              ),
              Gaps.vGap18,
              CallCenterItemWidget(
                itemName: 'contact_us',
                onTap: () {
                  Navigator.pushNamed(context, Routes.contactUsRoutes);
                },
              ),
              Gaps.vGap18,
              CallCenterItemWidget(
                itemName: 'privacy_policy',
                onTap: () {
                  Navigator.pushNamed(context, Routes.privacyPolicyRoute);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CallCenterItemWidget extends StatelessWidget {
  final void Function()? onTap;
  final String itemName;
  const CallCenterItemWidget({
    super.key,
    this.onTap,
    required this.itemName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 23.w,
        ),
        height: 57.h,
        decoration: BoxDecoration(
            color: colors.backGround,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: colors.buttonColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              itemName.tr,
              style: TextStyles.bold18(),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 24.r,
            ),
          ],
        ),
      ),
    );
  }
}
