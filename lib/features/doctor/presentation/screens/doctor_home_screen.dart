import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hania/config/locale/app_localizations.dart';
import 'package:hania/config/routes/app_routes.dart';
import 'package:hania/core/utils/values/assets.dart';
import 'package:hania/core/utils/values/text_styles.dart';
import 'package:hania/core/widgets/gaps.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:hania/features/doctor/presentation/widgets/custom_home_item.dart';

class DoctorHomeScreen extends StatelessWidget {
  const DoctorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late AppLocalizations locale = AppLocalizations.of(context)!;
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              topContainer(),
              Gaps.hGap12,
              Padding(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          Assets.imagesMyFileIcon,
                          height: 25.h,
                          width: 30.w,
                        ),
                        Gaps.hGap10,
                        Text(
                          "my_files".tr,
                          style: TextStyles.bold20(),
                        ),
                      ],
                    ),
                    Gaps.vGap12,
                    GridView.count(
                        crossAxisCount: 2,
                        physics: const NeverScrollableScrollPhysics(),
                        //  childAspectRatio: 0.95,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 20,
                        shrinkWrap: true,
                        children:  [
                          CustomHomeItem(
                              title: "needed_visits",
                              image: Assets.visitsNeededImage,
                              onTap: (){
                                Navigator.pushNamed(context, Routes.neededVisitsScreenRoute);
                              },
                          ),
                          CustomHomeItem(
                              title: "done_visits",
                              image: Assets.todoListImage,
                            onTap: (){
                              Navigator.pushNamed(context, Routes.completedVisitsScreenRoute);
                            },
                          ),
                          CustomHomeItem(
                              title: "patient_files",
                              image: Assets.patientFilesImage,
                            onTap: (){
                              Navigator.pushNamed(context, Routes.patientsFilesScreenRoute);
                            },
                          ),
                          CustomHomeItem(
                              title: "patient_bells",
                              image: Assets.patientBillsImage,
                            onTap: (){},
                          ),
                        ])
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: CircularMenu(
          animationDuration: const Duration(milliseconds: 700),
          toggleButtonBoxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 0),
            ),
          ],
          alignment:
              locale.isEnLocale ? Alignment.bottomRight : Alignment.bottomLeft,
          radius: 150.r,
          toggleButtonSize: 40.r,
          toggleButtonColor: const Color(0xff110E45),
          items: [
            CircularMenuItem(
              icon: Icons.settings_outlined,
              iconColor: Colors.black,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 0),
                ),
              ],
              onTap: () {
                Navigator.pushNamed(context, Routes.doctorSettingScreenRoute);
              },
            ),
            CircularMenuItem(
              icon: Icons.person_2_outlined,
              iconColor: Colors.black,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 0),
                ),
              ],
              onTap: () {},
            ),
            CircularMenuItem(
              icon: Icons.notifications_outlined,
              iconColor: Colors.black,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 0),
                ),
              ],
              onTap: () {},
            ),
          ],
        ));
  }

//   Widget buildCircularMenu() {
//     return
//   }
// }

  Widget topContainer() {
    return Container(
      height: 84.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      color: const Color(0xffd8f4f4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            Assets.personImage,
            height: 50.h,
            width: 50.w,
          ),
          Gaps.hGap12,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('مرحبا , د/محمد', style: TextStyles.bold16()),
              Gaps.vGap4,
              Text(
                'السبت , يناير 20',
                style: TextStyles.semiBold16(color: const Color(0xff1EB7CF)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
