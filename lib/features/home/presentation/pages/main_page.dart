import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '/config/locale/app_localizations.dart';
import '/core/utils/constants.dart';
import '/core/utils/enums.dart';
import '/core/utils/values/assets.dart';
import '/features/auth/presentation/cubit/auto_login/auto_login_cubit.dart';
import '../../../../core/utils/values/strings.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/exit_app_dialog.dart';
import '../../../../core/widgets/show_dialog.dart';
import '../../../../injection_container.dart';
import '../../../profile/presentation/cubit/get_profile/get_profile_cubit.dart';
import '../../controller/bottom_nav_bar/bottom_nav_bar_cubit.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    super.initState();

    context.read<AutoLoginCubit>().getUserType();

    // context.read<GetProfileCubit>().fGetProfile();
    // context.read<GetNotificationsCubit>().fPagination(
    //   onSuccess: (response) {
    //     context.read<GetNotificationsCubit>().changeUnreadCount(
    //         response.response?['params']?['unread_count'] ?? 0);
    //   },
    // );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      remoteConfigService.checkForUpdates(context);
    });
  }

  List<String> appBarTitles = [
    'app_name',
    'myOrders',
    'cart',
  ];

  @override
  Widget build(BuildContext context) {
    // AppLocalizations locale = AppLocalizations.of(context)!;
    return PopScope(
      onPopInvoked: (value) async {
        await showAppDialog(
              context: context,
              child: const ExitAppDialog(),
            ) ??
            false;
      },
      child: BlocConsumer<BottomNavBarCubit, BottomNavBarState>(
        listenWhen: (pre, current) => pre.index != current.index,
        listener: (context, state) {
          // if (state.index == 4) {
          //   context.read<GetProfileCubit>().fGetProfile();
          // }
        },
        builder: (context, state) {
          return Scaffold(
            // appBar: state.index == 3
            //     ? null
            //     : AppBar(
            //   backgroundColor: colors.backGround,
            //   elevation: 0,
            //   //titleSpacing: 10.h,
            //   automaticallyImplyLeading: false,
            //   title: state.index == 0
            //       ? Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Row(
            //         children: [
            //           Text(
            //            'أهلاً بك .......',
            //             style: TextStyles.regular16(
            //                 color: Colors.black),
            //           ),
            //
            //           // const GetUserName(),
            //         ],
            //       ),
            //       RichText(
            //         text: TextSpan(
            //           text: 'تطبيقنا المميز ',
            //           style: TextStyles.bold20(color: Colors.black),
            //           children: <TextSpan>[
            //             TextSpan(
            //                 text: 'مغسول',
            //                 style: TextStyles.bold20(
            //                     color: colors.main)),
            //           ],
            //         ),
            //       )
            //     ],
            //   )
            //       : Text(locale.text(appBarTitles[state.index])),
            //   actions: state.index == 0
            //       ? [
            //     Padding(
            //       padding: EdgeInsets.only(
            //         top: 3.r,
            //         bottom: 4.r,
            //       ),
            //       child: Container(
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(16.r),
            //           color: const Color(0xffEEEEEE),
            //         ),
            //         padding: EdgeInsets.all(16.r),
            //         child: InkWell(
            //           onTap: () {
            //             Navigator.pushNamed(context,
            //                 Routes.notificationsScreensRoute);
            //           },
            //           child: Stack(
            //             alignment: Alignment.topRight,
            //             children: [
            //               SvgPicture.asset(SvgAssets.notification),
            //               CircleAvatar(
            //                 radius: 8.r,
            //                 backgroundColor:
            //                 const Color(0xffD61842),
            //               )
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //     Gaps.hGap8,
            //   ]
            //       : [
            //     // Padding(
            //     //   padding: EdgeInsets.all(16.0.r),
            //     //   child: InkWell(
            //     //     onTap: () => context
            //     //         .read<BottomNavBarCubit>()
            //     //         .changeCurrentScreen(index: 0),
            //     //     child: SvgPicture.asset(SvgAssets.backIcon),
            //     //   ),
            //     // )
            //   ],
            // ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey[200]!)),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 10.r),
                child: GNav(
                    selectedIndex: state.index,
                    onTabChange: (index) => context
                        .read<BottomNavBarCubit>()
                        .changeCurrentScreen(index: index),
                    tabBorderRadius: 72,
                    color: Colors.grey[400],
                    gap: 10.r,
                    activeColor: Colors.white,
                    tabBackgroundColor: colors.main,
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.r, vertical: 12.r),
                    // navigation bar padding
                    tabs: [
                      GButton(
                        icon: Icons.home_outlined,
                        text: Strings.home,
                      ),
                      GButton(
                          icon: Icons.dashboard_outlined,
                          text: 'my_orders'.tr,
                          leading: SvgPicture.asset(Assets.orderIconNavBarSvg,
                              colorFilter:
                                  Constants.colorFilter(colors.buttonColor))),
                      GButton(
                        icon: Icons.message_outlined,
                        text: Strings.notifications,
                        leading: SvgPicture.asset(Assets.messageIconNavBarSvg,
                            colorFilter:
                                Constants.colorFilter(colors.buttonColor)),
                      ),
                      GButton(
                        icon: Icons.person_outline_rounded,
                        leading: SvgPicture.asset(Assets.personIconSvg,
                            colorFilter:
                                Constants.colorFilter(colors.buttonColor)),
                        text: Strings.myAccount,
                      )
                    ]),
              ),
            ),
            // bottomNavigationBar: BottomNavigationBar(
            //   currentIndex: state.index,
            //   onTap: (index) => context
            //       .read<BottomNavBarCubit>()
            //       .changeCurrentScreen(index: index),
            //   items: [
            //     BottomNavigationBarItem(
            //       icon: SvgPicture.asset(Assets.iconsHome),
            //       activeIcon: SvgPicture.asset(Assets.iconsHomeActive),
            //       label: Strings.home,
            //     ),
            //     BottomNavigationBarItem(
            //       icon: SvgPicture.asset(Assets.iconsMyBooking),
            //       activeIcon: SvgPicture.asset(Assets.iconsMyBookingActive),
            //       label: Strings.myBookings,
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Container(
            //         width: 48.w,
            //         height: 48.h,
            //         decoration: BoxDecoration(
            //           shape: BoxShape.circle,
            //           color: colors.main,
            //         ),
            //         child: Center(
            //           child: SvgPicture.asset(Assets.iconsQrCodeScan),
            //         ),
            //       ),
            //       activeIcon: Container(
            //         width: 48.w,
            //         height: 48.h,
            //         decoration: BoxDecoration(
            //           shape: BoxShape.circle,
            //           color: colors.main,
            //         ),
            //         child: Center(
            //           child: SvgPicture.asset(Assets.iconsQrCodeScan),
            //         ),
            //       ),
            //       label: '',
            //     ),
            //     BottomNavigationBarItem(
            //       icon: BlocBuilder<GetNotificationsCubit, PaginationState>(
            //         builder: (BuildContext context, PaginationState state) {
            //           if (context.read<GetNotificationsCubit>().unreadCount <
            //               1) {
            //             return SvgPicture.asset(Assets.iconsNotifications);
            //           }
            //           return notificationBadge(
            //             iconSvg: Assets.iconsNotifications,
            //             unreadCounter:
            //                 context.read<GetNotificationsCubit>().unreadCount,
            //           );
            //         },
            //       ),
            //       activeIcon:
            //           BlocBuilder<GetNotificationsCubit, PaginationState>(
            //         builder: (BuildContext context, PaginationState state) {
            //           if (context.read<GetNotificationsCubit>().unreadCount <
            //               1) {
            //             return SvgPicture.asset(
            //                 Assets.iconsNotificationsActive);
            //           }
            //           return notificationBadge(
            //             iconSvg: Assets.iconsNotificationsActive,
            //             unreadCounter:
            //                 context.read<GetNotificationsCubit>().unreadCount,
            //           );
            //         },
            //       ),
            //       label: Strings.notifications,
            //     ),
            //     BottomNavigationBarItem(
            //       icon: SvgPicture.asset(Assets.iconsMyAccount),
            //       activeIcon: SvgPicture.asset(Assets.iconsMyAccountActive),
            //       label: Strings.myAccount,
            //     ),
            //   ],
            // ),
            body: BlocBuilder<GetProfileCubit, GetProfileState>(
              builder: (BuildContext context, GetProfileState getProfileState) {
                // if (getProfileState is GetProfileLoadingState) {
                //   return Center(child: const CircularProgressIndicator().appLoading);
                // }
                return (context.read<AutoLoginCubit>().userType ==
                        UserType.doctor)
                    ? context
                        .read<BottomNavBarCubit>()
                        .laundryscreens[state.index]
                    : (context.read<AutoLoginCubit>().userType ==
                            UserType.delivery)
                        ? context
                            .read<BottomNavBarCubit>()
                            .deliveryScreens[state.index]
                        : context
                            .read<BottomNavBarCubit>()
                            .screens[state.index];
              },
            ),
          );
        },
      ),
    );
  }

  Widget notificationBadge({
    required String iconSvg,
    required int unreadCounter,
  }) {
    return badges.Badge(
      position: badges.BadgePosition.topStart(top: -6, start: -4),
      showBadge: true,
      ignorePointer: false,
      badgeContent: Text(
        unreadCounter > 99 ? '99+' : unreadCounter.toString(),
        style: TextStyles.medium10(color: colors.upBackGround),
      ),
      badgeAnimation: const badges.BadgeAnimation.rotation(
        animationDuration: Duration(seconds: 1),
        colorChangeAnimationDuration: Duration(seconds: 1),
        loopAnimation: false,
        curve: Curves.fastOutSlowIn,
        colorChangeAnimationCurve: Curves.easeInCubic,
      ),
      badgeStyle: badges.BadgeStyle(
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
        shape: badges.BadgeShape.circle,
        badgeColor: colors.errorColor,
      ),
      child: SvgPicture.asset(iconSvg),
    );
  }
}
