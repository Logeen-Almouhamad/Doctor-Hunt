import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:grad_projectx2/core/constants/app_images.dart';
import 'package:grad_projectx2/core/constants/app_routes.dart';
import 'package:grad_projectx2/view/on_boarding/widgets/CustomOnBoardingScreen.dart';

class OnBoardingScreen02 extends StatelessWidget {
  const OnBoardingScreen02({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: CustomOnBoardingScreen(
          imagePath: AppImages.onBoardingImage2,
          title: 'Choose Best Doctors',
          onGetStarted: () {
            Get.offNamed(AppRoutes.onboarding3);
          },
          imagePath1:AppImages.circle2 ,
          circleRight: -(1.sw * 0.6), 
          circleLeft:0.w,
          circleTop: -(1.sh * 0.5),

          )
    );
  }}

