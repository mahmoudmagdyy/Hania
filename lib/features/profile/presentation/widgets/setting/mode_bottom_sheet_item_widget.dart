import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/core/utils/values/text_styles.dart';
import '/core/widgets/gaps.dart';
import '/injection_container.dart';

class ModeBottomSheetItemWidget extends StatelessWidget {
  final String itemName;

  final Color isSelect;
  const ModeBottomSheetItemWidget({
    super.key,
    required this.itemName,
    required this.isSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 39.w),
      child: Row(
        children: [
          CircleAvatar(
            radius: 10.r,
            backgroundColor: colors.main,
            child: CircleAvatar(
              radius: 8.5.r,
              backgroundColor: isSelect,
            ),
          ),
          Gaps.hGap12,
          Text(
            itemName,
            style: TextStyles.regular14(),
          ),
        ],
      ),
    );
  }
}
