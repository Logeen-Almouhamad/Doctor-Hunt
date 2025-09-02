import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:grad_projectx2/core/constants/app_images.dart';
import 'package:grad_projectx2/view/bottom_nav_bar/controller/bottom_nav_bar_controller.dart';
import 'package:grad_projectx2/view/doctor_live_chats/screen/doctor_live_chats_screen.dart';
import 'package:grad_projectx2/view/doctors_screen/screen/doctors_screen.dart';
import 'package:grad_projectx2/view/favourite_doctors/screen/favourite_doctors_screen.dart';
import 'package:grad_projectx2/view/home/screen/home_screen.dart';
class BottomNavBarScreen extends StatelessWidget {
  BottomNavBarScreen({super.key});

  final BottomNavBarController controller = Get.put(BottomNavBarController());

  final List<String> icons = [
    AppImages.homeIcon,
    AppImages.favoriteIcon,
    AppImages.manualIcon,
    AppImages.chatIcon,
  ];

  final List<Widget> screens = [
    const HomeScreen(),
    FavouriteDoctorsScreen(),
    DoctorsScreen(),
    DoctorLiveChatsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: screens[controller.selectedIndex.value],
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(0, 4),
                blurRadius: 180,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(icons.length, (index) {
              final isSelected = controller.selectedIndex.value == index;

              return GestureDetector(
                onTap: () => controller.changeTabIndex(index),
                child: Container(
                  width: 48.w,
                  height: 48.w,
                  decoration: isSelected
                      ? const BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle,
                        )
                      : const BoxDecoration(),
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    icons[index],
                    width: 22.w,
                    height: 22.h,
                    color: isSelected
                        ? AppColors.whiteColor
                        : AppColors.backArrowColor,
                  ),
                ),
              );
            }),
          ),
        ),
      );
    });
  }
}
