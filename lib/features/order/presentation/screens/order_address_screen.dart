import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/config/locale/app_localizations.dart';
import '/config/routes/app_routes.dart';
import '/core/utils/values/text_styles.dart';
import '/core/widgets/app_elevated_button.dart';
import '/core/widgets/custom_app_bar.dart';
import '/core/widgets/gaps.dart';
import '/injection_container.dart';
import '../widgets/stepper.dart';

class OrderAddressScreen extends StatefulWidget {
  const OrderAddressScreen({super.key});

  @override
  State<OrderAddressScreen> createState() => _OrderAddressScreenState();
}

bool isHomeSelected = false;
bool isOtherSelected = false;

class _OrderAddressScreenState extends State<OrderAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   flexibleSpace:Container(
      //     decoration: BoxDecoration(
      //       image: DecorationImage(image: AssetImage(Assets.appbarBackground),fit: BoxFit.fill,)
      //     ),
      //     //child: Image.asset(Assets.appbarBackground,fit: BoxFit.cover,),
      //   ) ,
      //   title:Text('ordering_process'.tr) ,
      // ),

      body: Column(
        children: [
          // Stack(
          //   alignment: Alignment.centerRight,
          //   children: [
          //     Image.asset(Assets.appbarBackground,fit: BoxFit.cover,),
          //     Positioned(
          //       top: 35,
          //       right: 0,
          //       child: Row(
          //         children: [
          //           const BackButton(),
          //           Text('ordering_process'.tr),
          //         ],
          //       ),
          //     )
          //   ],
          // ),
          CustomAppBar(
            txt: 'ordering_process'.tr,
          ),
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const StepperItem(
                  activeStep: 0,
                ),
                Gaps.vGap12,
                Text(
                  'اختر عنوان من عناوين الشحن',
                  style: TextStyles.regular16(),
                ),
                Gaps.vGap10,
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isHomeSelected = !isHomeSelected;
                      isOtherSelected = false;
                    });
                  },
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(
                                width: 1,
                                color: isHomeSelected
                                    ? colors.main
                                    : colors.borderColor)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.home,
                                  color: colors.iconColor,
                                ),
                                Gaps.hGap8,
                                Text(
                                  'المنزل',
                                  style: TextStyles.regular16(),
                                )
                              ],
                            ),
                            Gaps.vGap10,
                            Text(
                              'محمد أحمد عبدالرحمن',
                              style: TextStyles.regular14(),
                            ),
                            Gaps.vGap10,
                            Text(
                              '+966 123 145 145',
                              style: TextStyles.regular14(),
                            ),
                            Gaps.vGap12,
                            Text(
                              'شارع المدينة فيلا رقم 12-بمكة المكرمة السعودية',
                              style: TextStyles.regular14(),
                            ),
                          ],
                        ),
                      ),
                      isHomeSelected
                          ? Positioned(
                              top: 8,
                              left: 8,
                              child: CircleAvatar(
                                radius: 18.r,
                                backgroundColor: colors.main,
                                child: const Icon(
                                  Icons.check,
                                  size: 30,
                                ),
                              ),
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
                Gaps.vGap20,
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isOtherSelected = !isOtherSelected;
                      isHomeSelected = false;
                    });
                  },
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Container(
                        padding: EdgeInsets.all(12.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(
                                width: 1,
                                color: isOtherSelected
                                    ? colors.main
                                    : colors.borderColor)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.home,
                                  color: colors.iconColor,
                                ),
                                Gaps.hGap8,
                                Text(
                                  'عنوان آخر',
                                  style: TextStyles.regular16(),
                                )
                              ],
                            ),
                            Gaps.vGap10,
                            Text(
                              'محمد أحمد عبدالرحمن',
                              style: TextStyles.regular14(),
                            ),
                            Gaps.vGap10,
                            Text(
                              '+966 123 145 145',
                              style: TextStyles.regular14(),
                            ),
                            Gaps.vGap12,
                            Text(
                              'شارع المدينة فيلا رقم 12-بمكة المكرمة السعودية',
                              style: TextStyles.regular14(),
                            ),
                          ],
                        ),
                      ),
                      isOtherSelected
                          ? Positioned(
                              top: 8,
                              left: 8,
                              child: CircleAvatar(
                                radius: 18.r,
                                backgroundColor: colors.main,
                                child: const Icon(Icons.check),
                              ),
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
                Gaps.vGap50,
                AppElevatedButton(
                    text: 'إضافة عنوان جديد',
                    onPressed: () {
                      Navigator.pushNamed(
                          context, Routes.addAddressScreenRoute);
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
