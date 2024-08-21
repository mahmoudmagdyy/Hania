import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hania/features/profile/presentation/screens/profile/profile_screen.dart';

import '../../../order/presentation/screens/order_screen.dart';
import '/features/home/presentation/pages/scan_qr_code_screen.dart';
import '/features/my_orders/presention/screen/my_orders_screen.dart';
import '/features/notifications/presentation/screens/notification_screen.dart';
import '../../../laundry/presentation/screens/laundry_home_screen.dart';
import '../../../laundry/presentation/screens/laundry_orders_screen.dart';
import '../../presentation/pages/home_screen.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(const BottomNavBarState());

  int currentIndex = 0;
  final List<Widget> screens = [
    HomeScreen(),
    const OrderScreen(),
    const ProfileScreen()


  ];
  final List<Widget> laundryscreens = [
    LaundryHomeScreen(),
    const LaundryOrdersScreen(),
    const ScanQrCodeScreen(),
    const NotificationScreen(),
    const SizedBox(),
  ];
  final List<Widget> deliveryScreens = [
    LaundryHomeScreen(),
    const LaundryOrdersScreen(),
    const ScanQrCodeScreen(),
    const NotificationScreen(),
    const SizedBox(),
  ];

  Future<void> changeCurrentScreen({required int index}) async {
    currentIndex = index;
    emit(BottomNavBarState(index: currentIndex));
  }
}
