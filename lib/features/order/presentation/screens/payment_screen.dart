import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/config/routes/app_routes.dart';
import '/core/widgets/app_elevated_button.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/gaps.dart';
import '../../../../injection_container.dart';
import '../widgets/stepper.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

bool isCardSelected = false;
bool isCashSelected = false;

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            txt: 'الدفع',
          ),
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const StepperItem(
                  activeStep: 1,
                ),
                Gaps.vGap12,
                Text(
                  'اختر طريقة من طرق الدفع',
                  style: TextStyles.regular16(),
                ),
                Gaps.vGap10,
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isCardSelected = !isCardSelected;
                      isCashSelected = false;
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
                                color: isCardSelected
                                    ? colors.main
                                    : colors.borderColor)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.credit_card,
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
                              'الانتهاء فى 02/22/2023',
                              style: TextStyles.regular14(),
                            ),
                          ],
                        ),
                      ),
                      isCardSelected
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
                      isCashSelected = !isCashSelected;
                      isCardSelected = false;
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
                                color: isCashSelected
                                    ? colors.main
                                    : colors.borderColor)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.layers_rounded,
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
                              'الدفع كاش عند تسليم الاوردر',
                              style: TextStyles.regular14(),
                            ),
                          ],
                        ),
                      ),
                      isCashSelected
                          ? Positioned(
                              top: 8,
                              left: 8,
                              child: CircleAvatar(
                                radius: 18.r,
                                backgroundColor: colors.main,
                                child: const Icon(
                                  Icons.check,
                                ),
                              ),
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
                Gaps.vGap50,
                AppElevatedButton(
                    text: 'إضافة بطاقة جديدة',
                    onPressed: () {
                      Navigator.pushNamed(
                          context, Routes.orderCompletedScreenRoute);
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
