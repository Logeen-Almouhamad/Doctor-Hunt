import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/view/forgot_password/reset_password_bottomsheet.dart';
import 'package:grad_projectx2/view/sign_in/controller/sign_in_controller.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text.dart';
import '../../core/constants/app_text_styles.dart';
import '../../widgets/custom_button.dart';

class OtpBottomSheet extends StatelessWidget {
  const OtpBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignInController>();
    final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());
    final List<TextEditingController> controllers =
    List.generate(4, (_) => TextEditingController());

    return Padding(
        padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,),
      child: SingleChildScrollView(
        child: Container(
          height: 390.h,
          width: double.infinity,
          padding: EdgeInsets.only(top: 75.h,left: 19.w,right: 19.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppText.mainTextBottomSheet2,
                  style: AppTextStyles.textStyleBlack24w500),
              SizedBox(height: 12.h,),
              Text(AppText.subTextBottomSheet2,
                  style: AppTextStyles.textStyleGrey14w400),

              SizedBox(height: 36.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return SizedBox(
                    width: 54.w,
                    height: 54.h,
                    child: TextField(
                      controller: controllers[index],
                      focusNode: focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      maxLength: 1,
                      cursorColor: AppColors.backArrowColor,
                      style: AppTextStyles.textStyleGreen26w700,
                      decoration: InputDecoration(
                        counterText: '',
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                            color: AppColors.sizedBoxBorderColor,
                            width: 0.8.h,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                            color: AppColors.sizedBoxBorderColor,
                            width: 0.8.h,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                            color: AppColors.sizedBoxBorderColor,
                            width: 0.8.h,
                          ),
                        ),
                      ),

                      onChanged: (value) {
                        if (value.isNotEmpty && index < 3) {
                          FocusScope.of(context).requestFocus(focusNodes[index + 1]);
                        } else if (value.isEmpty && index > 0) {
                          FocusScope.of(context).requestFocus(focusNodes[index - 1]);
                        }
                      },
                    ),

                  );
                }),
              ),
              SizedBox(height: 39.h),
          Center(
            child: CustomButton(text: AppText.continueTextButton, onPressed: () {
              final otp = controllers.map((c) => c.text).join();
              if (kDebugMode) {
                print("✅ OTP Entered: $otp");
              }
              Navigator.pop(context);

              showModalBottomSheet(
                context: context,
                barrierColor: AppColors.backgroundColorBehindBottomSheet,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) => const ResetPasswordBottomSheet(),
              );
            },
            ),
          ),
            ],
          ),
        ),
      ),
    );
  }
}
