import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../widgets/custom_button.dart';

class ThankYouModal extends StatelessWidget {
  final VoidCallback onDone;
  final VoidCallback onEdit;
  final String doctorName;
  final String date;
  final String time;
  const ThankYouModal({
    super.key,
    required this.onDone,
    required this.onEdit,
    required this.doctorName,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: SizedBox(
        width: 335.w,
        height: 520.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 156.w,
                height: 156.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      'assets/icons/like.svg', 
                      width: 72.w,
                      height: 69.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Text('Thank You !', style: AppTextStyles.thankYouText),
              SizedBox(height: 5.h),
              Text('Your Appointment Successful',
                  style: AppTextStyles.subThankYouText,
                  textAlign: TextAlign.center),
              SizedBox(height: 29.h),
              Text(
                'You booked an appointment with Dr. $doctorName on $date, at $time PM',
                style: AppTextStyles.appoinText,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 29.h),
              CustomButton(
                text: 'Done',
                onPressed: onDone,
              ),
              SizedBox(height: 18.h),
              GestureDetector(
                onTap: onEdit,
                child: Text(
                  'Edit your appointment',
                  style: AppTextStyles.appoinText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
