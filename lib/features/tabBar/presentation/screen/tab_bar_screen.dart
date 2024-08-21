import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hania/config/routes/app_routes.dart';
import 'package:hania/injection_container.dart';

import '../../../../config/locale/app_localizations.dart';

import '../../../home/presentation/pages/home_screen.dart';
import '../../../profile/presentation/screens/profile/profile_screen.dart';

import '/features/tabBar/presentation/cubit/tabbar_cubit/tabbar_cubit.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  TabBarScreenState createState() => TabBarScreenState();
}

class TabBarScreenState extends State<TabBarScreen> {
  final PageStorageBucket bucket = PageStorageBucket();

  List<Widget> tabs = [HomeScreen(), const ProfileScreen()];
  List<String> appBarTitles = [
    'app_name',
    'myOrders',
    'cart',
  ];

  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabbarCubit, TabbarState>(
      builder: (context, state) {
        return PopScope(
          canPop: state.index == 0,
          onPopInvoked: _onWillPop,
          child: Scaffold(
            body: PageStorage(
              bucket: bucket,
              child: tabs[state.index],
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey[200]!)),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 16.r),
                child: GNav(
                    selectedIndex: state.index,
                    onTabChange: (index) => onTapped(index),
                    tabBorderRadius: 72,
                    color: Colors.grey[400],
                    gap: 10.r,
                    activeColor: Colors.white,
                    tabBackgroundColor: const Color(0xff8800FF),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    // navigation bar padding
                    tabs: [
                      GButton(
                        icon: Icons.home_outlined,
                        text: 'home'.tr,
                      ),
                      GButton(
                        icon: Icons.dashboard_outlined,
                        text: 'list'.tr,
                      ),
                    ]),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(onPressed: (){
              Navigator.pushNamed(context, Routes.orderScreenRoute);
            },
              backgroundColor: colors.main,
              child: Icon(Icons.add,color: colors.backGround,size: 22.sp,),

            ),
          ),
        );
      },
    );
  }

  _onWillPop(didPop) async {
    if (didPop) {
      await SystemNavigator.pop();
    } else {
      onTapped(0);
    }
  }

  void onTapped(int index) {
    Future.delayed(Duration.zero, () {
      BlocProvider.of<TabbarCubit>(context).updateCurrentPage(index);
    });
  }
}
