import 'package:flutter/material.dart';
import 'package:hania/features/auth/presentation/screen/credintial_code_screen.dart';
import 'package:hania/features/auth/presentation/screen/splash_screen.dart';
import 'package:hania/features/bill/presentation/screen/bill_detail_screen.dart';
import 'package:hania/features/bill/presentation/screen/bill_screen.dart';
import 'package:hania/features/doctor/presentation/screens/completed_visits_screen.dart';
import 'package:hania/features/doctor/presentation/screens/doctor_home_screen.dart';
import 'package:hania/features/doctor/presentation/screens/needed_visits_screen.dart';
import 'package:hania/features/doctor/presentation/screens/patients_files_screens.dart';
import 'package:hania/features/doctor/presentation/screens/visit_details_screen.dart';

import '../../features/doctor/presentation/screens/invoice.dart';
import '../../features/doctor/presentation/screens/patient_bills.dart';
import '/features/auth/presentation/screen/kind_user_screen.dart';
import '/features/auth/presentation/screen/landing_page.dart';
import '/features/auth/presentation/screen/on_boarding_screen.dart';
import '/features/auth/presentation/screen/otp_screen.dart';
import '/features/auth/presentation/screen/success_change_pass_screen.dart';
import '/features/laundry/presentation/screens/laundry_services_screen.dart';
import '/features/notifications/presentation/screens/notification_screen.dart';
import '/features/profile/presentation/screens/about_app/about_app_setting_screen.dart';
import '/features/profile/presentation/screens/call_center/call_center_screen.dart';
import '/features/profile/presentation/screens/contact_us/contact_us_screen.dart';
import '/features/profile/presentation/screens/privacy_policy/privacy_policy_screen.dart';
import '/features/profile/presentation/screens/public_quation/public_quation_screen.dart';
import '/features/profile/presentation/screens/setting/setting_screen.dart';
// import 'package:showcaseview/showcaseview.dart';

import '../../core/utils/app_strings.dart';
import '../../core/widgets/full_photo.dart';
import '../../core/widgets/slider_photo.dart';
import '../../features/auth/presentation/screen/change_password_screen.dart';
import '../../features/auth/presentation/screen/confirm_reset_password_screen.dart';
import '../../features/auth/presentation/screen/email_login_screen.dart';
import '../../features/auth/presentation/screen/forget_password_screen.dart';
import '../../features/auth/presentation/screen/login_screen.dart';
import '../../features/auth/presentation/screen/register_screen.dart';
import '../../features/auth/presentation/screen/reset_password_screen.dart';
import '../../features/auth/presentation/screen/review_my_data/flow_screen.dart';
import '../../features/auth/presentation/screen/review_my_data/review_my_data_screen.dart';
import '../../features/auth/presentation/screen/review_my_data/update_register_screen.dart';
import '../../features/auth/presentation/screen/second_register_screen.dart';
import '../../features/auth/presentation/screen/verification_email_screen.dart';
import '../../features/auth/presentation/screen/verification_mobile_screen.dart';
import '../../features/auth/presentation/screen/verification_reset_password_screen.dart';
import '../../features/auth/presentation/screen/welcome_screen.dart';
import '../../features/doctor/presentation/screens/doctor_setting_screen.dart';
import '../../features/home/presentation/pages/laundry_details_screen.dart';
import '../../features/home/presentation/pages/more_services_screen.dart';
import '../../features/laundry/presentation/screens/laundry_add_service_screen.dart';
import '../../features/laundry/presentation/screens/laundry_notification_screen.dart';
import '../../features/order/presentation/screens/add_address_screen.dart';
import '../../features/order/presentation/screens/order_address_screen.dart';
import '../../features/order/presentation/screens/order_completed_screen.dart';
import '../../features/order/presentation/screens/order_screen.dart';
import '../../features/order/presentation/screens/payment_screen.dart';
import '../../features/portal/presentation/pages/terms_screen.dart';
import '../../features/profile/presentation/screens/bio/bio_screen.dart';
import '../../features/profile/presentation/screens/doctor_title/doctor_title_screen.dart';
import '../../features/profile/presentation/screens/doctor_title/edit_doctor_title_screen.dart';
import '../../features/profile/presentation/screens/edit_profile_screen.dart';
import '../../features/tabBar/presentation/screen/tab_bar_screen.dart';
import '../../injection_container.dart';

class Routes {
  static const String initialRoute = '/';
  static const String welcomeRoute = '/WelcomeScreen';
  static const String landingPageRoute = '/LandingPage';
  static const String loginScreenRoute = '/LoginScreen';
  static const String emailLoginScreenRoute = '/EmailLoginScreen';
  static const String registerScreenRoute = '/RegisterScreen';
  static const String resetPasswordRoute = '/ResetPasswordScreen';
  static const String verificationMobileScreenRoute =
      '/VerificationMobileScreen';
  static const String verificationEmailScreenRoute = '/VerificationEmailScreen';
  static const String verificationResetPasswordScreenRoute =
      '/VerificationResetPasswordScreen';
  static const String confirmResetPasswordScreenRoute =
      '/ConfirmResetPasswordScreen';
  static const String flowScreenRoute = '/FlowScreen';
  static const String reviewMyDataScreenRoute = '/ReviewMyDataScreen';
  static const String editMyDataScreenRoute = '/EditMyDataScreen';

  static const String tabBarScreenRoute = '/TabBarScreen';
  static const String moreServicesScreenRoute = '/MoreServicesScreen';

  static const String changeLanguageRoute = '/ChangeLanguage';
  static const String termsScreenRoute = '/TermsScreen';
  static const String saveClinicRoute = '/SaveClinicScreen';
  static const String clinicsRoute = '/ClinicsScreen';
  static const String clinicDetailsRoute = '/ClinicDetailsScreen';
  static const String bioScreenRoute = '/BioScreen';
  static const String editBioScreenRoute = '/EditBioScreen';
  static const String editProfileScreenRoute = '/EditProfileScreen';
  static const String doctorTitleScreenRoute = '/DoctorTitleScreen';
  static const String editDoctorTitleScreenRoute = '/EditDoctorTitleScreen';
  static const String callsRoute = '/CallsScreen';
  static const String saveCallsRoute = '/SaveCallsScreen';

  //Added by Mmoheammed
  static const String qrScannerScreenRoute = '/QRScannerScreen';

  static const String medicalHistoryRoute = '/MyMedicalHistoryScreen';

  static const String saveMedicalHistoryRoute = '/SaveMyMedicalHistoryScreen';
  static const String addFollowUpScreenRoute = '/AddFollowUpScreen';

  static const String medHistoryFilterScreenRoute = '/MedHistoryFiltersScreen';
  static const String fullPhotoRoute = '/FullPhoto';
  static const String photoListRoute = '/PhotoList';
  static const String walletScreenRoute = '/walletScreenRoute';
  static const String walletRequestScreenRoute = '/WalletRequestScreenRoute';
  static const String walletDetailsScreenRoute = '/WalletDetailsScreenRoute';
  static const String walletHistoryScreenRoute = '/walletHistoryScreenRoute';
  static const String bankAccountsScreenRoute = '/BankAccountsScreen';
  static const String addBankAccountScreenRoute = '/AddBankAccountScreen';

  static const String settingsRoute = '/SettingsScreen';
  static const String hospitalInvitationsRoute = '/HospitalInvitationsScreen';
  static const String hospitalInvitationDetailsRoute =
      '/HospitalInvitationDetailsScreen';
  static const String kindUserRoute = '/KindUserScreen';
  static const String otpAuthRoute = '/OtpAuthScreen';
  static const String successChangePassRoute = '/SuccessChangePassScreen';
  static const String onBoardingRoute = '/OnBoardingScreen';
  static const String notificationsScreenRoute = '/NotificationsScreen';
  static const String laundryDetailsScreenRoute = '/LaundryDetailsScreen';
  static const String orderScreenRoute = '/OrderScreen';
  static const String orderAddressScreenRoute = '/OrderAddressScreen';
  static const String addAddressScreenRoute = '/AddAddressScreen';
  static const String paymentScreenRoute = '/PaymentScreen';
  static const String orderCompletedScreenRoute = '/OrderCompletedScreen';

//laundry
  static const String laundryNotificationScreenRoute =
      '/LaundryNotificationScreenRoute';
  static const String laundryServicesScreenRoute =
      '/LaundryServicesScreenRoute';
  static const String laundryAddServiceScreenRoute =
      '/LaundryAddServiceScreenRoute';

  static const String contactUsRoutes = '/ContactUsScreen';
  static const String publucQuationRoute = '/PublucQuationScreen';
  static const String callCenterRoute = '/CallCenterScreen';
  static const String privacyPolicyRoute = '/PrivacyPolicyScreen';
  static const String aboutUsRoute = '/AboutUsScreen';

  static const String doctorHomeScreenRoute = '/DoctorHomeScreen';
  static const String doctorSettingScreenRoute = '/DoctorSettingScreen';
  static const String neededVisitsScreenRoute = '/NeededVisitsScreen';
  static const String completedVisitsScreenRoute = '/CompletedVisitsScreen';
  static const String patientsFilesScreenRoute = '/PatientsFilesScreen';
  static const String visitDetailsScreenRoute = '/VisitDetailsScreen';

  //Amr Routes ----
  static const String secondRegisterRoute = '/SecondRegisterScreen';
  static const String forgetPasswordRoute = '/ForgetPasswordScreen';
  static const String credintialCodeRoute = '/CredintialCodeScreen';
  static const String changePasswordRoute = '/ChangePasswordScreen';

  //bill
  static const String billScreen = '/billScreen';
  static const String billScreenDetail = '/billScreenDetail';
  static const String invoiceScreen = '/invoiceScreen';
  static const String patientBillsScreen = '/patientBillsScreen';

}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) {
            return const SplashScreen();
          },
        );

      case Routes.welcomeRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const WelcomeScreen(),
        );

      case Routes.landingPageRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const LandingPage(),
        );

      case Routes.loginScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const LoginScreen(),
        );

      case Routes.verificationMobileScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const VerificationMobileScreen(),
        );

      case Routes.verificationEmailScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const VerificationEmailScreen(),
        );

      case Routes.emailLoginScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const EmailLoginScreen(),
        );

      case Routes.registerScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const RegisterScreen(),
        );

      case Routes.termsScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const TermsScreen(),
        );

      case Routes.flowScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const FlowScreen(),
        );

      case Routes.reviewMyDataScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const ReviewMyDataScreen(),
        );

      case Routes.editMyDataScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const UpdateRegisterScreen(),
        );

      case Routes.resetPasswordRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const ResetPasswordScreen(),
        );

      case Routes.verificationResetPasswordScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) =>
              const VerificationResetPasswordScreen(),
        );

      case Routes.confirmResetPasswordScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const ConfirmResetPasswordScreen(),
        );

      case Routes.bioScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const BioScreen(),
        );

      case Routes.fullPhotoRoute:
        String item = routeSettings.arguments as String;
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => FullPhotoScreen(image: item),
        );
      case Routes.photoListRoute:
        Map<String, dynamic> map =
            routeSettings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => SliderPhotoScreen(
            imagesFiles: map['imagesFiles'],
            images: map['images'],
            path: map['path'],
            imageIndex: map['imageIndex'],
          ),
        );

      case Routes.editProfileScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const EditProfileScreen(),
        );

      case Routes.doctorTitleScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const DoctorTitleScreen(),
        );
      case Routes.editDoctorTitleScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const EditDoctorTitleScreen(),
        );
      case Routes.kindUserRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const KindUserScreen(),
        );
      case Routes.otpAuthRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const OtpAuthScreen(),
        );
      case Routes.successChangePassRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) =>
              const SuccessChangePasswordScreen(),
        );
      case Routes.onBoardingRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const OnBoardingScreen(),
        );
      case Routes.notificationsScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const NotificationScreen(),
        );
      case Routes.laundryDetailsScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const LaundryDetailsScreen(),
        );
      case Routes.orderScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const OrderScreen(),
        );
      case Routes.orderAddressScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const OrderAddressScreen(),
        );
      case Routes.addAddressScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const AddAddressScreen(),
        );
      case Routes.paymentScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const PaymentScreen(),
        );
      case Routes.orderCompletedScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const OrderCompletedScreen(),
        );
      case Routes.settingsRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const SettingScreen(),
        );
      case Routes.contactUsRoutes:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ContactUsScreen(),
        );
      case Routes.publucQuationRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const PublicQuationScreen(),
        );
      case Routes.callCenterRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const CallCenterScreen(),
        );
      case Routes.privacyPolicyRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const PrivacyPolicyScreen(),
        );
      case Routes.aboutUsRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const AboutAppSettingScreen(),
        );

      //laundry
      case Routes.laundryNotificationScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const LaundryNotificationScreen(),
        );
      case Routes.laundryServicesScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const LaundryServicesScreen(),
        );
      case Routes.laundryAddServiceScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const LaundryAddServicesScreen(),
        );
      case Routes.tabBarScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const TabBarScreen(),
        );
      case Routes.moreServicesScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const MoreServicesScreen(),
        );

      // doctor section "ezzat"
      case Routes.doctorHomeScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const DoctorHomeScreen(),
        );

      case Routes.doctorSettingScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const DoctorSettingScreen(),
        );

      case Routes.neededVisitsScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const NeededVisitsScreen(),
        );

      case Routes.completedVisitsScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const CompletedVisitsScreen(),
        );

      case Routes.patientsFilesScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const PatientsFilesScreens(),
        );

      case Routes.visitDetailsScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const VisitDetailsScreen(),
        );

      case Routes.secondRegisterRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const SecondRegisterScreen(),
        );
      case Routes.forgetPasswordRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const ForgetPasswordScreen(),
        );
      case Routes.credintialCodeRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const CredintialCodeScreen(),
        );
      case Routes.changePasswordRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const ChangePasswordScreen(),
        );
        case Routes.billScreen:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const BillScreen(),
        );
        case Routes.billScreenDetail:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const BillDetailScreen(),
        );
        case Routes.invoiceScreen:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const InvoiceScreen(),
        );
        case Routes.patientBillsScreen:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const PatientBillsScreen(),
        );
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (BuildContext context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }

  static String get currentRoute => routesStack.last;

  static void pushRouteToRoutesStack(String route) {
    routesStack.add(route);
    ServiceLocator.injectRoutesStackSingleton(routesStack);
  }

  static void popRouteFromRoutesStack() {
    routesStack.removeLast();
    ServiceLocator.injectRoutesStackSingleton(routesStack);
  }
}
