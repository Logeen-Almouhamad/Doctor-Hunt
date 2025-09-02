import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_images.dart';
import 'package:grad_projectx2/core/constants/app_routes.dart';
import 'package:grad_projectx2/view/on_boarding/widgets/CustomOnBoardingScreen.dart';

class OnBoardingScreen03 extends StatelessWidget {
  const OnBoardingScreen03({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomOnBoardingScreen(
        imagePath: AppImages.onBoardingImage3,
        title: 'Easy Appointments',
        onGetStarted: () {
          Get.offNamed(AppRoutes.signUp);
        },
        imagePath1: AppImages.circle,
        circleRight: 0.w,
        circleLeft: -(1.sw * 0.6), 
        circleTop: -(1.sh * 0.5),
      ),
    );
  }
}
