import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:grad_projectx2/core/constants/app_images.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';
import 'package:grad_projectx2/view/doctor_live_chats/controller/doctor_live_controller.dart';
import 'package:grad_projectx2/view/doctor_live_chats/widget/comment_tile.dart';
import 'package:grad_projectx2/view/doctor_live_chats/widget/custom_app_bar1.dart';

class DoctorLiveChatsScreen extends StatelessWidget {
  final CommentController controller = Get.put(CommentController());
  final TextEditingController commentTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: CustomAppBar1(showBack: true),
      ),
      body: Stack(
        children: [
          // Background doctor image
          Positioned.fill(
            child: Image.asset(AppImages.beautiful_doctor, fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    AppColors.blackColor,       // Dark at bottom
                    AppColors.blackColor.withOpacity(0.1),  // Light at top (transparent)
                  ],
                ),
              ),
            ),

          ),
          // Comments overlay
          Positioned.fill(
            child: SafeArea(
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 80.h), // replace top padding
                    Obx(
                          () => Column(
                        children: controller.comments.map((comment) {
                          return CommentTile(comment: comment);
                        }).toList(),
                      ),
                    ),
                     SizedBox(height: 5.h),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: commentTextController,
                              decoration: InputDecoration(
                                hintText: "Add a Comment ....",
                                hintStyle: AppTextStyles.hintTextstyle,
                                filled: true,
                                fillColor: AppColors.whiteColor,
                                contentPadding:  EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 10.h,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.r),
                                  borderSide: BorderSide.none,
                                ),
                                prefixIcon: IconButton(
                                  icon: Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      'assets/icons/icon3.png',
                                      width: 40.w,
                                      height: 40.h,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (commentTextController.text.trim().isNotEmpty) {
                                      controller.addComment(
                                        "You",
                                        commentTextController.text.trim(),
                                      );
                                      commentTextController.clear();
                                    }
                                  },
                                ),
                                suffixIcon: IconButton(
                                  icon: Image.asset(
                                    'assets/icons/emoji.png',
                                    width: 18.h,
                                    height: 18.h,
                                  ),
                                  onPressed: () {
                                    FocusManager.instance.primaryFocus?.unfocus();
                                    SystemChannels.textInput.invokeMethod('TextInput.show');
                                  },
                                  color: AppColors.titleColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16), // prevent overflow when keyboard is open
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
