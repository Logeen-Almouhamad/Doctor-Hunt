import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:grad_projectx2/core/constants/app_images.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';
import 'package:grad_projectx2/view/patient_details_step_one/screen/patient_details_step_one.dart';
import 'package:grad_projectx2/widgets/custom_app_bar.dart';
import 'package:grad_projectx2/view/custom_background/screen/custom_background.dart';
import 'package:grad_projectx2/widgets/custom_button.dart';

class PatientDetails extends StatelessWidget {
  const PatientDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Column(
      children: [
        const CustomAppBar(title: 'Patient Details'),
        Expanded(
            child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 100.h),
          child: Center(
            child: Column(
              children: [
                Container(
                  width: 214.w,
                  height: 214.h,
                  padding: EdgeInsets.only(left: 38.w, right: 54.w, top: 57.h, bottom: 59.h),
                  decoration: BoxDecoration(
                    color: AppColors.containerColor,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    AppImages.noDetailsIcon,
                    
                  ),
                ),
                SizedBox(
                  height: 41.h,
                ),
                Text(
                  'Your cart is empty',
                  style: AppTextStyles.noDetailsTextStyle,
                ),
                SizedBox(
                  height: 35.h,
                ),
                CustomButton(text: 'Add Tests', onPressed: () {
                  Get.to(PatientDetailsStepOne());
                }),
              ],
            ),
          ),
        )),
      ],
    ));
  }
}
