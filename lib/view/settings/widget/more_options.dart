import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:grad_projectx2/core/constants/app_images.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';

class MoreOptions extends StatelessWidget {
  final String title;
  final String? valueText;
  final bool showArrow;
  final bool hasSwitch;
  final bool switchValue;
  final ValueChanged<bool>? onSwitchChanged;
  final VoidCallback? onTap;

  const MoreOptions({
    super.key,
    required this.title,
    required this.showArrow,
    required this.hasSwitch,
    required this.switchValue,
    this.onSwitchChanged,
    this.onTap,
    this.valueText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: hasSwitch ? null : onTap,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.hintTextstyle,
                  ),
                ),
                if (hasSwitch)
                  Switch(
                    value: switchValue,
                    onChanged: onSwitchChanged,
                    activeColor: AppColors.primaryColor,
                    thumbColor: WidgetStateProperty.all(Colors.white),
                  )
                else if (valueText != null) ...[
                  Text(
                    valueText!,
                    style: AppTextStyles.bookButtonText.copyWith(
                      color: AppColors.backArrowColor,
                      
                    ),
                  ),
                  if (showArrow)
                    Padding(
                      padding: EdgeInsets.only(left: 7.w),
                      child: SvgPicture.asset(AppImages.forwardIcon),
                    ),
                ],
              ],
            ),
          ),
        ),
        Container(
          width: 335.w,
          height: 1.h,
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.06),
          ),
        ),
        
      ],
    );
  }
}
