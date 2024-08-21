import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/config/locale/app_localizations.dart';
import '/core/widgets/app_elevated_button.dart';
import '/core/widgets/gaps.dart';
import '/features/laundry/presentation/widgets/custom_app_bar.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/tags_text_form_field.dart';
import '../../../../injection_container.dart';

class LaundryAddServicesScreen extends StatefulWidget {
  const LaundryAddServicesScreen({super.key});

  @override
  State<LaundryAddServicesScreen> createState() =>
      _LaundryAddServicesScreenState();
}

class _LaundryAddServicesScreenState extends State<LaundryAddServicesScreen> {
  bool normalSelected = false;
  bool urgentSelected = false;
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(txt: 'addService'.tr),
          Gaps.vGap8,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('اسم الخدمة *', style: TextStyles.regular16()),
                Gaps.vGap8,
                AppTextFormField(
                  controller: searchController,
                  focusNode: searchFocus,
                  hintText: '',
                ),
                Gaps.vGap16,
                Text('نوع الخدمة*', style: TextStyles.regular16()),
                Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        setState(() {
                          normalSelected = !normalSelected;
                          urgentSelected = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: normalSelected
                                ? colors.main
                                : colors.backGround),
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(16.r),
                        child: Text('normal'.tr),
                      ),
                    )),
                    Gaps.hGap20,
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        setState(() {
                          urgentSelected = !urgentSelected;
                          normalSelected = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: urgentSelected
                                ? colors.main
                                : colors.backGround),
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(16.r),
                        child: Text('urgent'.tr),
                      ),
                    )),
                  ],
                ),
                Gaps.vGap16,
                Text('سعر الخدمة *', style: TextStyles.regular16()),
                Gaps.vGap8,
                AppTextFormField(
                  controller: searchController,
                  focusNode: searchFocus,
                  hintText: '',
                ),
                Gaps.vGap16,
                AppElevatedButton(text: 'اضافة', onPressed: () {})
              ],
            ),
          )
        ],
      ),
    );
  }
}
