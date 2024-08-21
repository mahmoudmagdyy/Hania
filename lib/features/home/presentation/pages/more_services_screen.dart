import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hania/config/locale/app_localizations.dart';

import '../../../../config/routes/app_routes.dart';
import '../widgets/service_item.dart';

class MoreServicesScreen extends StatelessWidget {
  const MoreServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('services'.tr),
      ),
      body: Padding(
        padding:  EdgeInsets.all(16.r),
        child: GridView.builder(
          itemBuilder: (context, index) => InkWell(
              onTap: () => Navigator.pushNamed(
                  context, Routes.laundryDetailsScreenRoute),
              child: const ServiceItem()),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
        ),
      ),
    );
  }
}
