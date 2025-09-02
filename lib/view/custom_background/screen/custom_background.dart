import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:grad_projectx2/view/custom_background/controller/custom_background_controller.dart';
import 'package:grad_projectx2/view/custom_side_bar/screen/custom_sidebar.dart';

class CustomBackground extends StatelessWidget {
  final Widget child;
  const CustomBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BackgroundController>(
      init: BackgroundController(),
      tag: UniqueKey().toString(),
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Stack(
          children: [
            Positioned(
              top: -33.h,
              left: -99.w,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 269, sigmaY: 269),
                child: Container(
                  width: 216.w,
                  height: 216.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.topCircleColor,
                  ),
                ),
              ),
            ),
            // Bottom blur circle
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


            GestureDetector(
              onHorizontalDragStart: (details) {
                if (!controller.sidebarOpen.value && details.globalPosition.dx < 40) {
                  controller.openSidebar();
                }
              },
              child: Obx(() {
                if (controller.sidebarOpen.value && controller.screenshotBytes.value != null) {
                  return Stack(
                    children: [
                      // Background gradient
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              AppColors.backgroundSideBarColor1,
                              AppColors.backgroundSideBarColor2,
                              AppColors.backgroundSideBarColor3,
                            ],
                            stops: const [0.0, 0.58, 1.0],
                          ),
                        ),
                      ),

                      // Sidebar
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 375.w,
                          height: 812.h,
                          child: const CustomSidebar(),
                        ),
                      ),

                      // Screenshot overlays
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: 120.w,
                          height: 531.h,
                          child: Stack(
                            children: [
                              // Blurred background
                              Positioned(
                                right: 32.w,
                                top: 101.h,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(30.r),
                                  ),
                                  child: Container(
                                    width: 88.w,
                                    height: 351.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(30.r),
                                      ),
                                    ),
                                    child: Opacity(
                                      opacity: 0.3,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Image.memory(
                                          controller.screenshotBytes.value!,
                                          fit: BoxFit.cover,
                                          alignment: Alignment.centerLeft,
                                          width: double.infinity,
                                          height: double.infinity,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              // Foreground
                              Positioned(
                                right: 0,
                                top: 0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(30.r),
                                  ),
                                  child: Container(
                                    width: 87.w,
                                    height: 531.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(30.r),
                                      ),
                                    ),
                                    child: Opacity(
                                      opacity: 1.0,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Image.memory(
                                          controller.screenshotBytes.value!,
                                          fit: BoxFit.cover,
                                          alignment: Alignment.centerLeft,
                                          width: double.infinity,
                                          height: double.infinity,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Tap to close sidebar
                      Positioned(
                        left: 260.w, // نفس عرض السايدبار
                        top: 0,
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: controller.closeSidebar,
                          behavior: HitTestBehavior.translucent,
                          child: Container(color: Colors.transparent),
                        ),
                      ),
                    ],
                  );
                } else {
                  // Normal screen
                  return RepaintBoundary(
                    key: controller.repaintKey,
                    child: SafeArea(child: child),
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
