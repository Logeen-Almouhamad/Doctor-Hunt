import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:grad_projectx2/core/constants/app_images.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';
import 'package:grad_projectx2/view/edit_%20profile/screen/edit_profile.dart';
import 'package:grad_projectx2/widgets/custom_app_bar.dart';
import 'package:grad_projectx2/view/custom_background/screen/custom_background.dart';
import 'package:grad_projectx2/widgets/custom_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.r),
                bottomLeft: Radius.circular(30.r),
              ),
            ),
            padding: EdgeInsets.only(bottom: 20.h),
            child: Column(
              children: [
                const CustomAppBar(
                  title: 'Profile',
                  titleColor: AppColors.whiteColor,
                ),
                Text(
                  'Set up your profile',
                  style: AppTextStyles.cardDiscountedPrice
                      .copyWith(color: AppColors.whiteColor),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Update your profile to connect your doctor with\nbetter impression.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.privacyPolicydescription
                      .copyWith(color: AppColors.whiteColor),
                ),
                SizedBox(
                  height: 22.h,
                ),
                Stack(
                  children: [
                    Image.asset(AppImages.profileImage),
                    Positioned(
                      bottom: 3.h,
                      right: 0.w,
                      child: SvgPicture.asset(AppImages.editImageIcon),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal information',
                    style: AppTextStyles.doctorName,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  _inputField(hint: 'Abdullah Mamun', label: 'Name'),
                  SizedBox(
                    height: 10.h,
                  ),
                  _inputField(
                      hint: '+8801800000000',
                      label: 'Contact Number',
                      showEditIcon: true),
                  SizedBox(
                    height: 10.h,
                  ),
                  _inputField(
                      hint: 'DD MM YYYY',
                      label: 'Date of birth',
                      showEditIcon: true),
                  SizedBox(
                    height: 10.h,
                  ),
                  _inputField(hint: 'Add Details', label: 'Location'),
                  SizedBox(
                    height: 32.h,
                  ),
                  Center(
                      child: CustomButton(text: 'Continue', onPressed: () {})),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _inputField({
  required String label,
  required String hint,
  bool showEditIcon = false,
}) {
  return Container(
    width: double.infinity,
    height: 65.h,
    decoration: BoxDecoration(
      color: AppColors.whiteColor,
      borderRadius: BorderRadius.circular(12.r),
      border: Border.all(color: AppColors.whiteColor),
    ),
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: Stack(
      alignment: Alignment.centerLeft,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: AppTextStyles.labelText.copyWith(fontSize: 11.sp),
            ),
            SizedBox(height: 4.h),
            Text(
              hint,
              style: AppTextStyles.hintTextstyle.copyWith(fontSize: 14.sp),
            ),
          ],
        ),
        if (showEditIcon)
          Positioned(
            right: 0,
            child: InkWell(
              onTap: () {
                Get.to(EditProfile());
              },
              child: Icon(
                Icons.edit,
                color: AppColors.backArrowColor,
                size: 16.sp,
              ),
            ),
          ),
      ],
    ),
  );
}

}
