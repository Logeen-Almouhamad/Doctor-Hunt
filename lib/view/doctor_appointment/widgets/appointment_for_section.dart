import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';

class AppointmentForSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Appointment For',
          style: AppTextStyles.doctorName,
        ),
        SizedBox(height: 20.h),
        _buildInputField('Patient Name'),
        SizedBox(height: 18.h),
        _buildInputField('Contact Number'),
      ],
    );
  }

  Widget _buildInputField(String hint) {
    return TextFormField(
      cursorColor: AppColors.backArrowColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 19.h),
        hintText: hint,
        hintStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w300,
            color: AppColors.backArrowColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
          borderSide: BorderSide(
              color: Color(0xff76809F).withOpacity(0.12), width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
          borderSide: BorderSide(
              color: Color(0xff76809F).withOpacity(0.12), width: 1.w),
        ),
        filled: false,
        fillColor: Colors.transparent,
      ),
    );
  }
}
