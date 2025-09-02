import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:grad_projectx2/core/constants/app_images.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';
import 'package:grad_projectx2/view/patient_details_step_one/controller/patient_details_step_controller.dart';
import 'package:grad_projectx2/widgets/custom_app_bar.dart';
import 'package:grad_projectx2/view/custom_background/screen/custom_background.dart';
import 'package:grad_projectx2/widgets/custom_button.dart';

class PatientDetailsStepOne extends StatelessWidget {
  PatientDetailsStepOne({super.key});

  final PatientDetailsStepController controller =
      Get.put(PatientDetailsStepController());

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Column(
      children: [
        const CustomAppBar(title: 'Patient Details'),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                  width: 335.w,
                  height: 38.h,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.blackColor.withOpacity(0.05),
                        blurRadius: 20,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Step 1/4',
                        style: AppTextStyles.stepsLevel,
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Expanded(
                        child: LinearProgressIndicator(
                          value: 0.25,
                          backgroundColor:
                              AppColors.primaryColor.withOpacity(0.30),
                          color: AppColors.primaryColor,
                          minHeight: 6.h,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                // Form Container
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 29.h),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.blackColor.withOpacity(0.05),
                        blurRadius: 20,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _label('Patient’s Name'),
                      SizedBox(
                        height: 9.h,
                      ),
                      _inputField(hint: 'Abdullah Mamun'),
                      SizedBox(
                        height: 16.h,
                      ),
                      _label('Age'),
                      SizedBox(
                        height: 9.h,
                      ),
                      Row(
                        children: [
                          Expanded(child: _dropdownField(hint: 'Day')),
                          SizedBox(width: 8.w),
                          Expanded(child: _dropdownField(hint: 'Month')),
                          SizedBox(width: 8.w),
                          Expanded(child: _dropdownField(hint: 'Year')),
                        ],
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      _label('Gender'),
                      SizedBox(height: 8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              child:
                                  _genderOption(label: 'Male', controller: controller)),
                          Expanded(child: _genderOption(label: 'Female',controller: controller)),
                          Expanded(child: _genderOption(label: 'Others',controller: controller)),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      _label('Mobile Number'),
                      SizedBox(
                        height: 9.h,
                      ),
                      _inputField(hint: '+8801000000000'),
                      SizedBox(
                        height: 17.h,
                      ),
                      _label('Email'),
                      SizedBox(
                        height: 9.h,
                      ),
                      _inputField(hint: 'itsmemamun1@gmail.com'),
                    ],
                  ),
                ),
                SizedBox(height: 38.h),
                CustomButton(text: 'Continue', onPressed: () {}),
                SizedBox(height: 50.h),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  Widget _label(String text) => Text(
        text,
        style: AppTextStyles.stepsLevel,
      );

  Widget _inputField({required String hint}) => TextField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppTextStyles.hintTextstyle,
          filled: true,
          fillColor: AppColors.whiteColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: AppColors.backArrowColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: AppColors.backArrowColor),
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 17.h),
        ),
      );

  Widget _dropdownField({required String hint}) => Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.backArrowColor),
        ),
        height: 50.h,
        child: Row(
          children: [
            Expanded(
              child: Text(
                hint,
                style: AppTextStyles.ageHintTextStyle,
              ),
            ),
            SvgPicture.asset(AppImages.dropDownIcon),
          ],
        ),
      );

  Widget _genderOption({
    required String label,
    required PatientDetailsStepController controller,
  }) {
    return Obx(
      () => Row(
        children: [
          Radio<String>(
            value: label,
            groupValue: controller.selectedGender.value,
            onChanged: (value) {
              if (value != null) controller.selectGender(value);
            },
            activeColor: AppColors.primaryColor,
            visualDensity: VisualDensity.compact,
          ),
          Flexible(
            child: Text(
              label,
              style: AppTextStyles.hintTextstyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
