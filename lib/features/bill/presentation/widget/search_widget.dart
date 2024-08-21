import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hania/config/locale/app_localizations.dart';

import '../../../../core/utils/app_colors.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.symmetric(horizontal:10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            width: 1,
            color: Colors.grey,
          )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            const Icon(Icons.search,size: 24,color: MyColors.secondaryColor,),
            SizedBox(width: 8.w,),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  border:InputBorder.none,
                  hintText: 'search_for_service'.tr,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
