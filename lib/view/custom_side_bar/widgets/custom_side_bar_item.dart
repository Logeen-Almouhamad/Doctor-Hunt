import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class SidebarItem extends StatelessWidget {
  final String assetPath;
  final String title;
  final VoidCallback? onTap;
  final bool showTrailing;
  final TextStyle? textStyle;
  final bool fromHome;

  const SidebarItem({
    super.key,
    required this.assetPath,
    required this.title,
    this.onTap,
    this.showTrailing = true,
    this.textStyle,
    this.fromHome = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        assetPath,
        color: AppColors.whiteColor,
      ),
      title: Text(
        title,
        style: textStyle ?? AppTextStyles.textStyleWhit16w400,
      ),
      trailing: showTrailing
          ? Padding(
              padding: EdgeInsets.only(right: fromHome ? 0 : 130.w),
              child:
                  const Icon(Icons.chevron_right, color: AppColors.whiteColor),
            )
          : null,
      onTap: onTap ?? () {},
      contentPadding:
          fromHome ? EdgeInsets.symmetric(horizontal: 8.w) : EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      tileColor: Colors.white.withOpacity(0.07),
      minLeadingWidth: 0,
    );
  }
}
