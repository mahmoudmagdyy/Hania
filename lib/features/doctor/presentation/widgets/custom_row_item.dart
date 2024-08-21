import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/gaps.dart';

class CustomItemRow extends StatelessWidget {
  const CustomItemRow({
    super.key, required this.title, required this.image,
  });
  final String title,image;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(image),
        Gaps.hGap10,
        Text(title , style: TextStyles.regular18(),maxLines: 2,),
      ],
    );
  }
}