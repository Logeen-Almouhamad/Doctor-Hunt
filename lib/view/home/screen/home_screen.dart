import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:grad_projectx2/core/constants/app_images.dart';
import 'package:grad_projectx2/core/constants/app_routes.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';
import 'package:grad_projectx2/view/custom_background/screen/custom_background.dart';
import 'package:grad_projectx2/view/custom_side_bar/screen/custom_sidebar.dart';
import 'package:grad_projectx2/view/home/controller/home_controller.dart';
import 'package:grad_projectx2/widgets/featured_doctors.dart';

import '../../../widgets/custom_search_bar.dart';
import '../../../widgets/popular_doctors_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeScreenController controller = Get.put(HomeScreenController());
    final List<String> imageList = [
      AppImages.conatinerImage,
      AppImages.conatinerImage2,
      AppImages.conatinerImage3,
    ];

    return Scaffold(
      drawer: const CustomSidebar(fromHome: true,),
      body: Stack(
        children: [
          // Background starts *after* the top Container
          Positioned(
            top: 156.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomBackground(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      'Live Doctors',
                      style: AppTextStyles.headline,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    // Live Doctors Section
                    SizedBox(
                      height: 168.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: imageList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                EdgeInsets.only(right: 12.w), // مسافة بين الصور
                            child: SizedBox(
                              width: 116.w,
                              height: 168.h,
                              child: Stack(
                                children: [
                                  // صورة الخلفية
                                  Positioned.fill(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(6.r),
                                      child: Image.asset(imageList[index],
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  // التدرج الأسود
                                  Positioned.fill(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(6.r),
                                        gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                            AppColors.blackColor
                                                .withOpacity(0.4),
                                            AppColors.blackColor
                                                .withOpacity(0.2),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  // أيقونة التشغيل
                                  Positioned(
                                    left: 0.w,
                                    right: 0.w,
                                    bottom: 0.h,
                                    top: 0.h,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 40.w, vertical: 50.h),
                                      child:
                                          SvgPicture.asset(AppImages.playIcon),
                                    ),
                                  ),
                                  // أيقونة Live
                                  Positioned(
                                    top: 11.h,
                                    right: 11.w,
                                    child: SvgPicture.asset(AppImages.liveIcon),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 25.h),
                    // Cards
                    SizedBox(
                      height: 100.h,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildGradientCard(
                              icon: AppImages.teeth,
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.gridOneFirstColor,
                                  AppColors.gridOneSecondColor
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            _buildGradientCard(
                              icon: AppImages.heart,
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.gridFourFirstColor,
                                  AppColors.gridFourSecondColor
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            _buildGradientCard(
                              icon: AppImages.eye,
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.gridThreeFirstColor,
                                  AppColors.gridThreeSecondColor
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            _buildGradientCard(
                              icon: AppImages.body,
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.gridTwoFirstColor,
                                  AppColors.gridTwoSecondColor
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //popular Doctor
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'Popular Doctor',
                          style: AppTextStyles.headline,
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Get.toNamed(AppRoutes.popularDoctors);
                          },
                          child: Text('See all',
                              style: AppTextStyles.doctorspecialty),
                        ),
                        Icon(Icons.chevron_right,
                            size: 14.sp, color: const Color(0xFF6B7280)),
                      ],
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    Obx(() => PopularDoctorsList(
                        popularDoctors: controller.popularDoctors.toList())),
                    //feature Doctor
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'Feature Doctor',
                          style: AppTextStyles.headline,
                        ),
                        const Spacer(),
                        Text('See all', style: AppTextStyles.doctorspecialty),
                        Icon(Icons.chevron_right,
                            size: 14.sp, color: const Color(0xFF6B7280)),
                      ],
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    Obx(() => FeaturedDoctorsList(
                          doctors: controller.featuredDoctors.toList(),
                        )),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Header UI
          Column(
            children: [
              // Top Header Container
              Container(
                width: double.infinity,
                height: 165.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Hi Handwerker!',
                          style: AppTextStyles.homeSubitle,
                        ),
                        Text(
                          'Find Your Doctor',
                          style: AppTextStyles.homeTitle,
                        ),
                      ],
                    ),
                    ClipOval(
                      clipBehavior: Clip.none,
                      child: Image.asset(
                        AppImages.user1,
                        width: 60.w,
                        height: 60.h,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Search bar in front, slightly overlapping the top container
          Positioned(
            top: 140.h,
            left: 20.w,
            right: 20.w,
            child:  InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.findDoctors);
              },
              child: CustomSearchBar(
                hintText: 'Search.....',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGradientCard({
    required String icon,
    required Gradient gradient,
  }) {
    return Container(
      width: 80.w,
      height: 100.h,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Center(
        child: SvgPicture.asset(
          icon,
        ),
      ),
    );
  }
}
