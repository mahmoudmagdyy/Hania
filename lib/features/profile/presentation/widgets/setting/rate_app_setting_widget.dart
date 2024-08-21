import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/config/locale/app_localizations.dart';
import '/core/utils/values/text_styles.dart';
import '/core/widgets/gaps.dart';
import '/core/widgets/my_default_button.dart';
import '/core/widgets/tags_text_form_field.dart';
import '/features/profile/presentation/widgets/setting/star_item_widget.dart';
import '/injection_container.dart';

class RateAppSettingWidget extends StatefulWidget {
  const RateAppSettingWidget({super.key});

  @override
  State<RateAppSettingWidget> createState() => _RateAppSettingWidgetState();
}

class _RateAppSettingWidgetState extends State<RateAppSettingWidget> {
  num isCheck = 0;
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        height: 380.h,
        padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 13.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SizedBox(
                width: 40.w,
                child: Divider(
                  thickness: 3.5.h,
                ),
              ),
            ),
            Gaps.vGap15,
            Text(
              'rank_app'.tr,
              style: TextStyles.bold14(),
            ),
            Gaps.vGap15,
            const Divider(),
            Gaps.vGap22,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 55.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  StarItemWidget(
                    onTap: () {
                      setState(() {
                        isCheck = 1;
                      });
                    },
                    itemName: 'exlant'.tr,
                    isSelect: isCheck == 1 ? true : false,
                  ),
                  StarItemWidget(
                    onTap: () {
                      setState(() {
                        isCheck = 2;
                      });
                    },
                    itemName: 'very_good'.tr,
                    isSelect: isCheck == 2 ? true : false,
                  ),
                  StarItemWidget(
                    onTap: () {
                      setState(() {
                        isCheck = 3;
                      });
                    },
                    itemName: 'good'.tr,
                    isSelect: isCheck == 3 ? true : false,
                  ),
                  StarItemWidget(
                    onTap: () {
                      setState(() {
                        isCheck = 4;
                      });
                    },
                    itemName: 'normal'.tr,
                    isSelect: isCheck == 4 ? true : false,
                  ),
                ],
              ),
            ),
            Gaps.vGap18,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'notes'.tr,
                    style: TextStyles.bold14(),
                  ),
                  Gaps.vGap10,
                  AppTextFormField(
                    controller: controller,
                    focusNode: focusNode,
                    hintText: '',
                    maxLines: 2,
                    backgroundColor: colors.backGround.withOpacity(.3),
                    borderColor: colors.backGround.withOpacity(.3),
                  ),
                  Gaps.vGap10,
                  MyDefaultButton(
                    onPressed: () {},
                    btnText: 'send',
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
