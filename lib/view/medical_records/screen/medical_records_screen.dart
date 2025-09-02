import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_routes.dart';
import 'package:grad_projectx2/view/custom_background/screen/custom_background.dart';
import 'package:grad_projectx2/widgets/custom_bottomsheet.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_text.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_button.dart';

class MedicalRecordsScreen extends StatelessWidget {
  const MedicalRecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Column(
      children: [
        const CustomAppBar(title: AppText.medicalRecordsText),
        Expanded(
            child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(
                height: 90.h,
              ),
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 107.r,
                      backgroundColor: AppColors.lightBlueColor,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.w),
                          child: Image.asset(
                            AppImages.medicalRecordsImage,
                            width: 107.w,
                            height: 118.h,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      AppText.mainTextMedicalRecords,
                      style: AppTextStyles.textStyleBlack22w700,
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    Text(
                      AppText.subTextMedicalRecords,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.textStyleGrey14w400,
                    ),
                    SizedBox(
                      height: 33.h,
                    ),
                    CustomButton(
                      text: AppText.addARecordButton,
                      onPressed: () {
                        Get.bottomSheet(
                          MyBottomSheetContent(
                            onClose: () {
                              // لما البوتوم شيت يقفل نروح للصفحة
                              Get.toNamed(AppRoutes.addRecord);
                            },
                          ),
                          isScrollControlled: true,
                          isDismissible: true, // عشان تضغط برا وتقفل
                          enableDrag: true, // عشان تقدر تسحب لتنزيل البوتوم شيت
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ))
      ],
    ));
  }
}
