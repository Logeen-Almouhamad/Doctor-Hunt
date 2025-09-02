import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:grad_projectx2/core/constants/app_images.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';
import 'package:grad_projectx2/view/settings/controller/settings_controller.dart';
import 'package:grad_projectx2/view/settings/widget/more_options.dart';
import 'package:grad_projectx2/view/settings/widget/setting_items.dart';
import 'package:grad_projectx2/widgets/custom_app_bar.dart';
import 'package:grad_projectx2/view/custom_background/screen/custom_background.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsController());
    return CustomBackground(
      child: Column(
        children: [
          const CustomAppBar(title: 'Settings'),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Account settings',
                    style: AppTextStyles.cardPrice
                        .copyWith(color: AppColors.backArrowColor),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  SettingItems(
                    title: 'Change Password',
                    icon: AppImages.changePasswordIcon,
                    iconColor: AppColors.changePasswordIconColor,
                  ),
                  SettingItems(
                    title: 'Notifications',
                    icon: AppImages.notificationsIcon,
                    iconColor: AppColors.notificationsIconColor,
                  ),
                  SettingItems(
                    title: 'Statistics',
                    icon: AppImages.statisticsIcon,
                    iconColor: AppColors.statisticsIconColor,
                  ),
                  SettingItems(
                    title: 'About us',
                    icon: AppImages.assisIcon,
                    iconColor: AppColors.aboutUsIconColor,
                  ),
                  SizedBox(
                    height: 27.h,
                  ),
                  Text(
                    'More options',
                    style: AppTextStyles.cardPrice.copyWith(
                        color: AppColors.backArrowColor, fontSize: 16.sp),
                  ),
                  SizedBox(
                    height: 17.h,
                  ),
                  Obx(() => MoreOptions(
                        title: 'Text messages',
                        showArrow: false,
                        hasSwitch: true,
                        switchValue: controller.isTextMessagesOn.value,
                        onSwitchChanged: controller.toggleTextMessages,
                      )),
                  Obx(() => MoreOptions(
                        title: 'Phone calls',
                        showArrow: false,
                        hasSwitch: true,
                        switchValue: controller.isPhoneCallsOn.value,
                        onSwitchChanged: controller.togglePhoneCalls,
                      )),
                  MoreOptions(
                    title: 'Languages',
                    showArrow: true,
                    valueText: 'English',
                    switchValue: false,
                    hasSwitch: false,
                    onTap: () {},
                  ),
                  MoreOptions(
                    title: 'Currency',
                    showArrow: true,
                    valueText: '\$-USD',
                    switchValue: false,
                    hasSwitch: false,
                    onTap: () {},
                  ),
                  MoreOptions(
                    title: 'Linked accounts',
                    showArrow: true,
                    valueText: 'Facebook, Google',
                    switchValue: false,
                    hasSwitch: false,
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
