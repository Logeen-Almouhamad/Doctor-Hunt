import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/view/patient_details/screen/patient_details.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';


class PatientOption extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Color backgroundColor;
  final String? imagePath;

  const PatientOption({
    Key? key,
    required this.title,
    this.icon,
    required this.backgroundColor,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 149.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 100.w,
            height: 125.h,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Center(
              child: icon != null && title == ''
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          icon,
                          color: AppColors.primaryColor,
                          size: 40.sp,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Add',
                          style: AppTextStyles.subtitle.copyWith(
                            fontSize: 18.sp,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    )
                  : (imagePath != null
                      ? InkWell(
                        onTap: () {
                          Get.to(PatientDetails());
                        },
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(6.r),
                            child: Image.asset(
                              imagePath!,
                              width: 100.w,
                              height: 125.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                      )
                  : SizedBox.shrink()),
            ),
          ),
          if (!(icon != null && title == '')) ...[
            SizedBox(height: 7.h),
            Text(
              title,
              style: AppTextStyles.patientName,
            ),
          ]
        ],
      ),
    );
  }
} 