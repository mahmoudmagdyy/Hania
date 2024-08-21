import 'package:flutter/material.dart';

import '../../../../core/utils/values/assets.dart';
import '../../../../core/utils/values/text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.txt});
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Image.asset(
          Assets.appbarBackground,
          fit: BoxFit.fill,
        ),
        Positioned(
          top: 35,
          right: 0,
          child: Row(
            children: [
              const BackButton(),
              Text(txt, style: TextStyles.bold16()),
            ],
          ),
        )
      ],
    );
  }
}
