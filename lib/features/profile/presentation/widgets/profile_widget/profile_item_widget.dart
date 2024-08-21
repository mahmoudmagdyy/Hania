import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hania/core/utils/values/assets.dart';

import '../../../../../core/utils/svg_manager.dart';
import '../../../../../core/widgets/gaps.dart';
import '/core/utils/constants.dart';
import '/core/utils/values/text_styles.dart';
import '/injection_container.dart';

class ProfileItemWidget extends StatelessWidget {
  final String itemName;
  final String itemImage;
  final bool showArrow;
  final bool isSvg;
  final Color? imageColorFilter;
  final void Function()? onTap;
  const ProfileItemWidget({
    super.key,
    required this.itemName,
    required this.itemImage,
    this.onTap,
    required this.showArrow,
    this.imageColorFilter,
    required this.isSvg,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    isSvg?
                    SvgPicture.asset(itemImage):Image.asset(itemImage),
                    Gaps.hGap12,
                    Text(itemName,style: TextStyles.regular18(),)
                  ],
                ),
                Icon(Icons.arrow_forward_ios_rounded,size: 22.sp,)
              ],
            ),
          ),
          Gaps.vGap15,
          Divider(color: colors.profileDividerColor,thickness: 1,),
        ],
      ),
    );
  }
}
