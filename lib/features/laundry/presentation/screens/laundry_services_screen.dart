import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/config/locale/app_localizations.dart';
import '/config/routes/app_routes.dart';
import '/core/widgets/gaps.dart';
import '/features/laundry/presentation/widgets/custom_app_bar.dart';
import '/features/laundry/presentation/widgets/service_container.dart';
import '../../../../core/widgets/tags_text_form_field.dart';
import '../../../../injection_container.dart';
import '../widgets/edit_service_sheet.dart';

class LaundryServicesScreen extends StatefulWidget {
  const LaundryServicesScreen({super.key});

  @override
  State<LaundryServicesScreen> createState() => _LaundryServicesScreenState();
}

class _LaundryServicesScreenState extends State<LaundryServicesScreen> {
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(txt: 'services'.tr),
          Gaps.vGap8,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: AppTextFormField(
                controller: searchController,
                focusNode: searchFocus,
                hintText: 'تبحث عن شي .. ؟',
                prefixIcon: Icon(
                  Icons.search_sharp,
                  color: colors.main,
                )),
          ),
          Gaps.vGap16,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => const EditServiceSheet());
                  },
                  child: const ServiceContainer(
                    title: 'غسيل ملابس',
                    hasIcon: true,
                  )),
              InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => const EditServiceSheet());
                  },
                  child: const ServiceContainer(
                      title: 'تنظيف جاف', hasIcon: true)),
            ],
          ),
          Gaps.vGap8,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => const EditServiceSheet());
                  },
                  child: const ServiceContainer(
                      title: 'كوي ملابس', hasIcon: true)),
              InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => const EditServiceSheet());
                  },
                  child: const ServiceContainer(
                      title: 'صباغة الملابس', hasIcon: true)),
            ],
          ),
          Gaps.vGap8,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                      context, Routes.laundryAddServiceScreenRoute);
                },
                child: ServiceContainer(
                    title: 'addService'.tr, color: colors.main)),
          ),
        ],
      ),
    );
  }
}
