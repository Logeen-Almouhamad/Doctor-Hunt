import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_routes.dart';
import 'package:grad_projectx2/widgets/logout_dialog.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_text.dart';
import '../../../core/constants/app_text_styles.dart';
import '../widgets/custom_side_bar_item.dart';

class CustomSidebar extends StatelessWidget {
  final VoidCallback? onClose;
  final bool fromHome;
  const CustomSidebar({
    super.key,
    this.onClose,
    this.fromHome = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260.w,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF4B5FA5),
            Color(0xFF001F3F),
          ],
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 40.h,
              left: 20.w,
              right: 20.w,
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed(AppRoutes.profile);
                          },
                          child: CircleAvatar(
                            radius: 22.r,
                            child: Image.asset(
                              AppImages.profileImage,
                              width: 44.r,
                              height: 44.r,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Abdullah Mamun',
                                  style: AppTextStyles.textStyleWhit16w500),
                              SizedBox(height: 4.h),
                              Row(
                                children: [
                                  Icon(Icons.phone,
                                      color: AppColors.whiteColor, size: 14.w),
                                  SizedBox(width: 4.w),
                                  Text('01303-527300',
                                      style:
                                          AppTextStyles.textStyleWhite12w400),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 70.h),

                    Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: SidebarItem(
                        fromHome: fromHome,
                        assetPath: AppImages.profileIcon,
                        title: AppText.myDoctorsText,
                        onTap: () {
                          if (onClose != null) onClose!();
                          Future.delayed(const Duration(milliseconds: 200), () {
                            Get.toNamed(AppRoutes.myDoctors);
                          });
                        },
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: SidebarItem(
                        fromHome: fromHome,
                        assetPath: AppImages.medicalRecordsIcon,
                        title: AppText.medicalRecordsText,
                        onTap: () {
                          if (onClose != null) onClose!();
                          Future.delayed(const Duration(milliseconds: 200), () {
                            Get.toNamed(AppRoutes.allRecords);
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 9.h),
                      child: SidebarItem(
                        fromHome: fromHome,
                        assetPath: AppImages.paymentIcon,
                        title: AppText.paymentsText,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: SidebarItem(
                        fromHome: fromHome,
                        assetPath: AppImages.medicineOrdersIcon,
                        title: AppText.medicineOrdersText,
                        onTap: () {
                          if (onClose != null) onClose!();
                          Future.delayed(const Duration(milliseconds: 200), () {
                            Get.toNamed(AppRoutes.orderMedicine);
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: SidebarItem(
                        fromHome: fromHome,
                        assetPath: AppImages.testBookingsIcon,
                        title: AppText.testBookingsText,
                        onTap: () {
                          if (onClose != null) onClose!();
                          Future.delayed(const Duration(milliseconds: 200), () {
                            Get.toNamed(AppRoutes.diagnosticsTests);
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: SidebarItem(
                        fromHome: fromHome,
                        assetPath: AppImages.privacyPolicyIcon,
                        title: AppText.privacyNPolicyText,
                        onTap: () {
                          if (onClose != null) onClose!();
                          Future.delayed(const Duration(milliseconds: 200), () {
                            Get.toNamed(AppRoutes.privacyAndPolicy);
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 9.h),
                      child: SidebarItem(
                        fromHome: fromHome,
                        assetPath: AppImages.helpCenterIcon,
                        title: AppText.helpCenterText,
                        onTap: () {
                          if (onClose != null) onClose!();
                          Future.delayed(const Duration(milliseconds: 200), () {
                            Get.toNamed(AppRoutes.helpCenter);
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 60.h),
                      child: SidebarItem(
                        fromHome: fromHome,
                        assetPath: AppImages.settingsIcon,
                        title: AppText.settingsText,
                        textStyle: AppTextStyles.textStyleWhit18w400,
                        onTap: () {
                          if (onClose != null) onClose!();
                          Future.delayed(const Duration(milliseconds: 200), () {
                            Get.toNamed(AppRoutes.settings);
                          });
                        },
                      ),
                    ),
                    // SizedBox(height: 30.h,),
                    SidebarItem(
                      fromHome: fromHome,
                      assetPath: AppImages.logoutIcon,
                      title: AppText.logOutText,
                      showTrailing: false,
                      textStyle: AppTextStyles.textStyleWhite20w500,
                      onTap: () {
                        if (onClose != null) onClose!();
                        Future.delayed(const Duration(milliseconds: 200), () {
                          showLogoutDialog();
                        });
                      },
                    ),
                    //const Spacer(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 40.h,
            right: 20.w,
            child: GestureDetector(
              onTap: onClose ?? () => Navigator.of(context).maybePop(),
              child: Container(
                width: 30.w,
                height: 30.w,
                decoration: BoxDecoration(
                  color: AppColors.favoriteIconColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.close, color: Colors.white, size: 22.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
