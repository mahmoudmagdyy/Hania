import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/config/locale/app_localizations.dart';
import '/core/utils/values/assets.dart';
import '/core/utils/values/text_styles.dart';
import '/core/widgets/gaps.dart';
import '/core/widgets/my_default_button.dart';
import '/injection_container.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  String phone = "01003954240";
  String? text = '';
  // String androidUrl = "whatsapp://send?phone=01003954240&text=Done";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                          size: 24.r,
                        ),
                      ),
                      Gaps.hGap10,
                      Text(
                        'contact_us'.tr,
                        style: TextStyles.bold16(),
                      ),
                    ],
                  ),
                  Gaps.vGap50,
                  Image.asset(Assets.contactUsImage),
                  Gaps.vGap40,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MailsContactUsItemWidget(
                        itemName: 'email'.tr,
                        itemImage: Assets.mailIconSvg,
                        itemColor: colors.errorColor.withOpacity(.2),
                        textColor: colors.errorColor,
                      ),
                      MailsContactUsItemWidget(
                        itemName: 'whats_app'.tr,
                        itemImage: Assets.whatsIconSvg,
                        itemColor: Colors.green.withOpacity(.2),
                        textColor: Colors.green,
                      ),
                    ],
                  ),
                  Gaps.vGap40,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 44.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 2.h,
                            color: colors.dividerColor,
                          ),
                        ),
                        Gaps.hGap8,
                        Text(
                          'message_us'.tr,
                          style: TextStyles.regular14(),
                        ),
                        Gaps.hGap8,
                        Expanded(
                          child: Divider(
                            thickness: 2.h,
                            color: colors.dividerColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gaps.vGap25,
                  CaontactUsItemWidget(
                    itemName: 'name'.tr,
                    itemImage: Assets.personIconSvg,
                  ),
                  CaontactUsItemWidget(
                    itemName: 'email'.tr,
                    itemImage: Assets.atIconSvg,
                  ),
                  CaontactUsItemWidget(
                    itemName: 'message_titel'.tr,
                    itemImage: Assets.saveIconSvg,
                  ),
                  CaontactUsItemWidget(
                    itemName: 'message'.tr,
                    itemImage: Assets.messageIconSvg,
                  ),
                  Gaps.vGap25,
                  MyDefaultButton(
                    onPressed: () {},
                    btnText: 'send',
                    borderRadius: 16.r,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MailsContactUsItemWidget extends StatelessWidget {
  final String itemName;
  final String itemImage;
  final Color itemColor;
  final Color textColor;

  const MailsContactUsItemWidget({
    super.key,
    required this.itemName,
    required this.itemImage,
    required this.itemColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: itemColor,
        borderRadius: BorderRadius.circular(35.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(itemImage),
          Gaps.hGap8,
          Text(
            itemName,
            style: TextStyles.regular14(color: textColor),
          ),
        ],
      ),
    );
  }
}

class CaontactUsItemWidget extends StatelessWidget {
  final String itemName;
  final String itemImage;
  final void Function()? onTap;
  const CaontactUsItemWidget({
    super.key,
    required this.itemName,
    required this.itemImage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55.h,
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(17.r),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1.5.h,
              color: colors.dividerColor,
            ),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(itemImage),
            Gaps.hGap10,
            Text(
              itemName,
              style: TextStyles.regular14(),
            )
          ],
        ),
      ),
    );
  }
}
