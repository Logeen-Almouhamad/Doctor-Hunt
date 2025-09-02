import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_routes.dart'; 

class SplashController extends GetxController{
   @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(AppRoutes.onboarding1);
    });
  }
}