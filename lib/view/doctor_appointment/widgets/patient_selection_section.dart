import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_projectx2/core/constants/app_images.dart';
import 'package:grad_projectx2/view/doctor_appointment/widgets/patient_option.dart';
import '../../../../../core/constants/app_colors.dart';

import '../../../../../core/constants/app_text_styles.dart';

class PatientSelectionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Who is this patient?',
          style: AppTextStyles.doctorName,
        ),
        SizedBox(height: 20.h),
        SizedBox(
          height: 155.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              PatientOption(
                  title: '',
                  icon: Icons.add,
                  backgroundColor: AppColors.addPatientColor,
                  imagePath: null),
              SizedBox(width: 10.w),
              PatientOption(
                title: 'My Self',
                icon: null,
                backgroundColor: AppColors.whiteColor,
                imagePath: AppImages.patientImage1,
              ),
              SizedBox(width: 10.w),
              PatientOption(
                title: 'My child',
                icon: null,
                backgroundColor: AppColors.whiteColor,
                imagePath: AppImages.patientImage2,
              ),
              SizedBox(width: 10.w),
              PatientOption(
                title: 'My Sisiter',
                icon: null,
                backgroundColor: AppColors.whiteColor,
                imagePath: AppImages.patientImage3,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
