import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:grad_projectx2/core/constants/app_routes.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';
import 'package:grad_projectx2/widgets/custom_button.dart';

class CustomOnBoardingScreen extends StatelessWidget {
  final String imagePath;
  final String imagePath1;
  final String title;
  final VoidCallback onGetStarted;
  final double circleRight;
  final double circleLeft;
  final double circleTop;

  const CustomOnBoardingScreen({
    super.key,
    required this.imagePath,
    required this.imagePath1,
    required this.title,
    required this.onGetStarted,
    required this.circleRight,
    required this.circleLeft,
    required this.circleTop,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Stack(
        children: [
          // Top-left Ellipse
          Positioned(
              top: circleTop,
              left: circleLeft,
              right: circleRight,
              child: Image.asset(
                imagePath1,
                //fit: BoxFit.cover,
              ) // or AppImages.circle
              ),

          // Bottom-right Ellipse
          Positioned(
            bottom: -100.h,
            right: -100.w,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 121, sigmaY: 121),
              child: Container(
                width: 257.w,
                height: 257.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.bottomCircleColor,
                ),
              ),
            ),
          ),

          Positioned.fill(
            child: SafeArea(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(top: 80.h),
                      child: Column(
                        children: [
                          Center(
                            child: ClipOval(
                              child: SizedBox(
                                width: 330.w,
                                height: 330.w,
                                child: Image.asset(
                                  imagePath,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 60.h),
                          Text(
                            title,
                            style: AppTextStyles.title,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 7.h),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              '''
Contrary to popular belief, Lorem Ipsum is not         
simply random text. It has roots in a piece of it 
over 2000 years old.
''',
                              style: AppTextStyles.subtitle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 24.h),
                          CustomButton(
                            text: 'Get Started',
                            onPressed: onGetStarted,
                          ),
                          SizedBox(height: 10.h),
                          TextButton(
                            onPressed: () {
                               Get.offNamed(AppRoutes.signUp);
                            },
                            child: Text(
                              'Skip',
                              style: AppTextStyles.subtitle,
                            ),
                          ),
                          SizedBox(height: 24.h),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
