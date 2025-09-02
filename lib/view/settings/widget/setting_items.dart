import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:grad_projectx2/core/constants/app_images.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';

class SettingItems extends StatelessWidget {
  final String title;
  final String icon;
  final Color iconColor;
  final VoidCallback? onTap;
  const SettingItems(
      {super.key,
      required this.title,
      required this.icon,
      this.onTap,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                  color: iconColor,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(icon),
              ),
              SizedBox(
                width: 20.w,
              ),
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.hintTextstyle,
                ),
              ),
              SvgPicture.asset(AppImages.forwardIcon),
            ],
          ),
        ),
        SizedBox(height: 17.h,),
        Container(
          width: 335.w,
          height: 1,
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.06),
          ),
        ),
        SizedBox(height: 12.h,),
      ],
    );
  }
}
