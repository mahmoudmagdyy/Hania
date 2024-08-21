import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/config/locale/app_localizations.dart';
import '/core/widgets/app_elevated_button.dart';
import '/core/widgets/gaps.dart';
import '../../../../core/utils/values/assets.dart';
import '../../../../core/widgets/tags_text_form_field.dart';
import '../../../../injection_container.dart';

class EditServiceSheet extends StatefulWidget {
  const EditServiceSheet({super.key});

  @override
  State<EditServiceSheet> createState() => _EditServiceSheetState();
}

final TextEditingController nameController = TextEditingController();
final FocusNode nameFocus = FocusNode();

class _EditServiceSheetState extends State<EditServiceSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: colors.upBackGround,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.vGap16,
              Row(
                children: [
                  const Icon(Icons.image),
                  Gaps.hGap4,
                  const Text('صورة الخدمة')
                ],
              ),
              Gaps.vGap16,
              Center(
                child: Image.asset(
                  Assets.services,
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
              Gaps.vGap8,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppTextFormField(
                  controller: nameController,
                  focusNode: nameFocus,
                  hintText: '',
                  labelText: 'serviceName'.tr,
                ),
              ),
              Gaps.vGap16,
              Row(
                children: [
                  AppElevatedButton(
                    text: 'delete'.tr,
                    onPressed: () {},
                    buttonColor: colors.upBackGround,
                    textColor: colors.highlight,
                    borderColor: colors.highlight,
                  ),
                  Gaps.hGap16,
                  Expanded(
                    child: AppElevatedButton(
                      onPressed: () {},
                      text: 'save'.tr,
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
