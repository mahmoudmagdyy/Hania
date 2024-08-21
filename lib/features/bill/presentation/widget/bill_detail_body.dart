import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hania/config/locale/app_localizations.dart';
import 'package:hania/core/utils/app_colors.dart';
import 'package:hania/features/bill/presentation/widget/bill_widget.dart';
import 'package:hania/features/bill/presentation/widget/price_widget.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import 'describtion_widget.dart';

class BillDetailBody extends StatelessWidget {
  const BillDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        forceMaterialTransparency: true,
        centerTitle: false,
        title: Text(
          'billsDetail'.tr,
          style: TextStyles.bold18(),
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              BillWidget(
             bodyColor: MyColors.backGroundContainerColor,
              ),
              SizedBox(height: 20.h),
              const DescriptionWidget(),
              SizedBox(height: 20.h),
              const PriceWidget(),
              SizedBox(height: 20.h),
              AppElevatedButton(
                text: "print_bills".tr,
                onPressed: (){},
              ),
          
          
            ],
          ),
        ),
      ),
    );
  }
}
