import 'package:get/get.dart';
import 'package:grad_projectx2/view/add_record/screen/add_record_screen.dart';
import 'package:grad_projectx2/view/all_records/screen/all_records_screen.dart';
import 'package:grad_projectx2/view/diagnostics_tests/screen/diagnostics_tests_screen.dart';
import 'package:grad_projectx2/view/doctor_appointemet_date/screen/doctor_appointement_date_screen.dart';
import 'package:grad_projectx2/view/doctor_appointment/screen/doctor_appointment_screen.dart';
import 'package:grad_projectx2/view/doctor_select_time/screen/doctor_select_time_screen.dart';
import 'package:grad_projectx2/view/enable_location_services/screen/enable_location_services_screen.dart';
import 'package:grad_projectx2/view/find_doctors/screen/find_doctors_screen.dart';
import 'package:grad_projectx2/view/help_center/screen/help_center_screen.dart';
import 'package:grad_projectx2/view/medical_records/screen/medical_records_screen.dart';
import 'package:grad_projectx2/view/medicine_orders/screen/medicine_orders_screen.dart';
import 'package:grad_projectx2/view/my_doctors/screen/my_doctors_screen.dart';
import 'package:grad_projectx2/view/order_medicine/screen/order_medicine_screen.dart';
import 'package:grad_projectx2/view/popular_doctor/screen/popular_doctor_screen.dart';
import 'package:grad_projectx2/view/privacy_policy/screen/privacy_policy_screen.dart';
import 'package:grad_projectx2/view/select_time/screen/doctor_select_time_screen2.dart';
import 'package:grad_projectx2/view/settings/screen/settings_screen.dart';
import 'view/home/screen/home_screen.dart';
import 'view/profile/screen/profile_screen.dart';
import 'view/doctor_details/screen/doctor_details_screen.dart';
import 'view/sign_in/screen/sign_in_screen.dart';
import 'view/sign_up/screen/sign_up_screen.dart';
import 'view/splash/screen/splash_screen.dart';
import 'view/on_boarding/screen/on_boarding_screen_01.dart';
import 'view/on_boarding/screen/on_boarding_screen_02.dart';
import 'view/on_boarding/screen/on_boarding_screen_03.dart';
import 'view/bottom_nav_bar/screen/bottom_nav_bar_screen.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: '/home',
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: '/profile',
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: '/doctor_details',
      page: () => DoctorDetailsScreen(),
    ),
    GetPage(
      name: '/sign_in',
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: '/sign_up',
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: '/splash',
      page: () => SplashScreen(),
    ),
    GetPage(
      name: '/onboarding1',
      page: () => const OnBoardingScreen01(),
    ),
    GetPage(
      name: '/onboarding2',
      page: () => const OnBoardingScreen02(),
    ),
    GetPage(
      name: '/onboarding3',
      page: () => const OnBoardingScreen03(),
    ),
    GetPage(
      name: '/popular_doctors',
      page: () => const PopularDoctorScreen(),
    ),
    GetPage(
      name: '/my_doctors',
      page: () => const MyDoctorsScreen(),
    ),
    GetPage(
      name: '/medical_records',
      page: () => const MedicalRecordsScreen(),
    ),
    GetPage(
      name: '/medicine_orders',
      page: () => MedicineOrdersScreen(),
    ),
    GetPage(
      name: '/privacy_and_policy',
      page: () => const PrivacyPolicyScreen(),
    ),
    GetPage(
      name: '/help_center',
      page: () =>  HelpCenterScreen(),
    ),
    GetPage(
      name: '/settings',
      page: () =>  SettingsScreen(),
    ),
    GetPage(
      name: '/diagnostics_tests',
      page: () => const DiagnosticsTestsScreen(),
    ),
    GetPage(
      name: '/doctor_details',
      page: () => DoctorDetailsScreen(),
    ),
    GetPage(
      name: '/doctor_appointment',
      page: () =>  DoctorAppointmentScreen(),
    ),
    GetPage(
      name: '/doctor_appointment_date',
      page: () =>  const DoctorAppointementDateScreen(),
    ),
    GetPage(
      name: '/all_records',
      page: () => AllRecordsScreen(),
    ),
    GetPage(
      name: '/add_record',
      page: () => const AddRecordScreen(),
    ),
    GetPage(
      name: '/find_doctors',
      page: () =>  FindDoctorsScreen(),
    ),
    GetPage(
      name: '/location',
      page: () => const EnableLocationServicesScreen(),
    ),
    GetPage(
      name: '/select_time',
      page: () =>  DoctorSelectTimeScreen(),
    ),
    GetPage(
      name: '/select_time2',
      page: () =>  const DoctorSelectTimeScreen2(),
    ),
    GetPage(
      name: '/order_medicine',
      page: () =>  const OrderMedicineScreen(),
    ),
    
   
    GetPage(
      name: '/main',
      page: () => BottomNavBarScreen(),
    ),
  ];
}
