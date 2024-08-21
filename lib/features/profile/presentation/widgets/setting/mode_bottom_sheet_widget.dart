import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/config/locale/app_localizations.dart';
import '/core/utils/values/text_styles.dart';
import '/core/widgets/gaps.dart';
import '/core/widgets/my_default_button.dart';
import '/features/profile/presentation/widgets/setting/mode_bottom_sheet_item_widget.dart';
import '/injection_container.dart';

class ModeBottomSheetWidget extends StatefulWidget {
  const ModeBottomSheetWidget({super.key});

  @override
  State<ModeBottomSheetWidget> createState() => _ModeBottomSheetWidgetState();
}

class _ModeBottomSheetWidgetState extends State<ModeBottomSheetWidget> {
  num isChoose = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.5.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: colors.backGround,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      height: 300.h,
      child: Column(
        children: [
          Gaps.vGap25,
          Text(
            'change_mode'.tr,
            style: TextStyles.bold14(),
          ),
          Gaps.vGap35,
          const Divider(),
          Gaps.vGap11,
          GestureDetector(
            onTap: () {
              setState(() {
                isChoose = 2;
              });
            },
            child: ModeBottomSheetItemWidget(
              itemName: 'dark_mode'.tr,
              isSelect: isChoose == 2 ? colors.main : colors.backGround,
            ),
          ),
          Gaps.vGap25,
          GestureDetector(
            onTap: () {
              setState(() {
                isChoose = 1;
              });
            },
            child: ModeBottomSheetItemWidget(
              itemName: 'light_mode'.tr,
              isSelect: isChoose == 1 ? colors.main : colors.backGround,
            ),
          ),
          const Spacer(),
          MyDefaultButton(
            onPressed: () {
              Navigator.pop(context);
            },
            btnText: 'submit',
          ),
          Gaps.vGap15,
        ],
      ),
    );
  }
}
