import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hania/config/locale/app_localizations.dart';
import 'package:hania/features/doctor/presentation/widgets/search_invoice_widget.dart';

import '../../../../core/utils/values/text_styles.dart';
import 'invoice_card.dart';

class InvoiceBodyScreen extends StatelessWidget {
  const InvoiceBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        centerTitle: false,
        title: Text(
          'inancial_Statements'.tr,
          style: TextStyles.bold18(),
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            SearchInvoiceWidget(),
            SizedBox(height: 30.h),
            InvoiceCard(),
            SizedBox(height: 20.h),
            InvoiceCard(),
            SizedBox(height: 20.h),
            InvoiceCard(),

          ],
        ),
      ),

    );
  }
}
