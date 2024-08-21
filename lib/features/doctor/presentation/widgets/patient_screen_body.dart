import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hania/config/locale/app_localizations.dart';
import 'package:hania/core/utils/values/assets.dart';
import 'package:hania/features/doctor/presentation/widgets/search_invoice_widget.dart';

import '../../../../core/utils/values/text_styles.dart';
import 'invoice_card.dart';

class PatientScreenBody extends StatelessWidget {
  const PatientScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        centerTitle: false,
        title: Text(
          'patient_bill'.tr,
          style: TextStyles.bold18(),
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Row(
              children: [
                const Expanded(child: SearchInvoiceWidget(hintText: "ابحث باسم المريض ",)),
                SvgPicture.asset(Assets.filterIcon),
              ],
            ),
            SizedBox(height: 30.h),
            const InvoiceCard(),
            SizedBox(height: 20.h),
            const InvoiceCard(),
            SizedBox(height: 20.h),
            const InvoiceCard(),

          ],
        ),
      ),

    );
  }
}
