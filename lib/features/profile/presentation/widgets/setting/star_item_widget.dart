import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/core/utils/values/text_styles.dart';
import '/core/widgets/gaps.dart';

class StarItemWidget extends StatelessWidget {
  final String itemName;
  final bool isSelect;
  final void Function()? onTap;
  const StarItemWidget({
    super.key,
    required this.itemName,
    required this.isSelect,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          isSelect
              ? Icon(
                  Icons.star,
                  size: 30.r,
                  color: Colors.amber[600],
                )
              : Icon(
                  Icons.star_border_outlined,
                  size: 30.r,
                ),
          Gaps.vGap18,
          Text(
            itemName,
            style: TextStyles.bold10(),
          )
        ],
      ),
    );
  }
}
