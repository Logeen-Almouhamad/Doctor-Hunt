import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_projectx2/view/sign_in/controller/sign_in_controller.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text.dart';
import '../../core/constants/app_text_styles.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/my_text_form_field.dart';
import 'package:get/get.dart';


class ResetPasswordBottomSheet extends StatelessWidget {
  const ResetPasswordBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignInController>();
    return Padding(
        padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,),
      child: SingleChildScrollView(
        child: Container(
          height: 470.h,
          width: double.infinity,
          padding: EdgeInsets.only(top: 75.h,left: 19.w,right: 19.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppText.mainTextBottomSheet3,
                  style: AppTextStyles.textStyleBlack24w500),
              SizedBox(height: 12.h,),
              Text(AppText.subTextBottomSheet3,
                  style: AppTextStyles.textStyleGrey14w400),

              SizedBox(height: 33.h),

              Obx(() => MyTextFormField(
                controller: controller.passwordController,
                labelText: AppText.newPasswordLabelText,
                borderColor : AppColors.sizedBoxBorderColor,
                obscureText: controller.isObscure.value,
                validator: (val) =>
                val!.length < 6 ? "Min 6 characters" : null,
                suffixIcon: IconButton(
                  icon: Icon(controller.isObscure.value
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: controller.togglePasswordVisibility,
                ),
              )),

              SizedBox(height: 18.h,),

              Obx(() => MyTextFormField(
                controller: controller.passwordController,
                labelText: AppText.reEnterPasswordLabelText,
                borderColor : AppColors.sizedBoxBorderColor,
                obscureText: controller.isObscure.value,
                validator: (val) =>
                val!.length < 6 ? "Min 6 characters" : null,
                suffixIcon: IconButton(
                  icon: Icon(controller.isObscure.value
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: controller.togglePasswordVisibility,
                ),
              )),
              SizedBox(height: 31.h,),
              Center(child: CustomButton(
                text: AppText.updatePasswordTextButton,
                onPressed: () {
                Get.back();
                Get.back();
                Get.back();
              },),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
