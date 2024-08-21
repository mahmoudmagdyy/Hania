import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hania/config/locale/app_localizations.dart';
import 'package:hania/core/utils/app_colors.dart';
import 'package:hania/core/utils/values/assets.dart';
import 'package:hania/core/utils/values/text_styles.dart';
import 'package:hania/core/widgets/gaps.dart';
import 'package:hania/core/widgets/search_text_field.dart';
class PatientsFilesScreens extends StatelessWidget {
  const PatientsFilesScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(21.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 30.r,
                    ),
                  ),
                  Gaps.hGap10,
                  Text(
                    'patient_files'.tr,
                    style: TextStyles.bold20(),
                  ),
                ],
              ),
              Gaps.vGap12,
              const MySearchBar(
                hintText: "ابحث بالاسم او رقم الملف ",
              ),
              Gaps.vGap20,
              Expanded(
                child: ListView.separated(
                  itemCount: 5,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                Assets.personImages,
                                height: 80.h,
                                width: 80.w,
                              ),
                              Gaps.hGap12,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('أسامة محمود', style: TextStyles.bold18()),
                                  Gaps.vGap4,
                                  Text(
                                    'H123456',
                                    style: TextStyles.regular16(color: const Color(0xff1EB7CF)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text('30 سنة',style: TextStyles.regular16().copyWith(color: MyColors.main),)
                        ],
                      ),
                  separatorBuilder: (context, index) =>  Divider(height: 30.h,),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
