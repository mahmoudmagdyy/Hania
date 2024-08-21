import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hania/config/locale/app_localizations.dart';
import 'package:hania/core/utils/app_colors.dart';
import 'package:hania/features/bill/presentation/screen/bill_detail_screen.dart';
import 'package:hania/features/bill/presentation/widget/search_widget.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/values/text_styles.dart';
import 'bill_widget.dart';

class BillScreenBody extends StatelessWidget {
  const BillScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
appBar:AppBar(
        centerTitle: false,
        title: Text(
          'bills'.tr,
          style: TextStyles.bold18(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
             SizedBox(height: 20.h,),
            const SearchWidget(),
            SizedBox(height: 30.h,),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.billScreenDetail);

                },
                child:  BillWidget()),
            SizedBox(height: 20.h,),
             BillWidget(),
          ],
        ),
      ),
    );
  }
}
