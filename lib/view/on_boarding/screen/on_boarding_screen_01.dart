import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_images.dart';
import 'package:grad_projectx2/core/constants/app_routes.dart';
import 'package:grad_projectx2/view/on_boarding/widgets/CustomOnBoardingScreen.dart';


class OnBoardingScreen01 extends StatelessWidget {
  const OnBoardingScreen01({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomOnBoardingScreen(
        imagePath: AppImages.onBoardingImage1,
        title: 'Find Trusted Doctors',
        onGetStarted: (){
          Get.offNamed(AppRoutes.onboarding2);
        },
        imagePath1:AppImages.circle,
        circleRight: 0.w,
        circleLeft: -170.w,
        circleTop: -290.h,),
    );
  }
}
