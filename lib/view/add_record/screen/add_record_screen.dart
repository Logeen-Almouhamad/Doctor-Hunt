import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:grad_projectx2/core/constants/app_images.dart';
import 'package:grad_projectx2/core/constants/app_routes.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';
import 'package:grad_projectx2/view/add_record/controller/add_record_controller.dart';
import 'package:grad_projectx2/view/custom_background/screen/custom_background.dart';
import 'package:grad_projectx2/widgets/custom_Text_form.dart';
import 'package:grad_projectx2/widgets/custom_app_bar.dart';
import 'package:grad_projectx2/widgets/custom_bottomsheet.dart';
import 'package:grad_projectx2/widgets/custom_button.dart';

class AddRecordScreen extends StatelessWidget {
  const AddRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AddRecordController controller = Get.find<AddRecordController>();

    return CustomBackground(
      child: Stack(
        children: [
          // المحتوى الرئيسي أعلى الشاشة
          Column(
            children: [
              const CustomAppBar(title: 'Add Records'),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6.r)),
                      ),
                      height: 125.h,
                      width: 100.w,
                      child: Image.asset(
                        AppImages.personImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.bottomSheet(
                          MyBottomSheetContent(),
                          isScrollControlled: true,
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.w),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.addImageConatinerColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(6.r)),
                          ),
                          height: 125.h,
                          width: 100.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const IconButton(
                                onPressed: null,
                                icon: Icon(
                                  Icons.add,
                                  color: AppColors.primaryColor,
                                  size: 29,
                                ),
                              ),
                              Text(
                                "Add more \n images",
                                textAlign: TextAlign.center,
                                style: AppTextStyles.addMoreImagesText,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
// Bottom sheet
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.blackColor.withOpacity(0.08),
                    spreadRadius: 0,
                    blurRadius: 20,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Record for", style: AppTextStyles.blackSubtitle),
                    CustomTextForm(
                      onChanged: (value) {
                        controller.recordName.value = value;
                      },
                      controller: controller.nameTextController,
                      hintText: "Abdulah mamun",
                      suffixIcon: Icon(
                        Icons.edit,
                        color: AppColors.backArrowColor,
                        size: 14.w,
                      ),
                    ),
                    const Divider(thickness: 0),
                    SizedBox(height: 18.h),
                    Text("Type of record", style: AppTextStyles.blackSubtitle),
                    SizedBox(height: 17.33.h),
                    Row(
                      children: controller.recordTypes.map((recordType) {
                        return Obx(() => GestureDetector(
                              onTap: () =>
                                  controller.selectRecordType(recordType),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () => controller
                                            .selectRecordType(recordType),
                                        child: SvgPicture.asset(
                                          recordType.imagePath,
                                          width: 17.w,
                                          height: 22.67.h,
                                          colorFilter: ColorFilter.mode(
                                            controller.selectedRecordType.value
                                                        ?.type ==
                                                    recordType.type
                                                ? AppColors.primaryColor
                                                : AppColors.backArrowColor,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 6.h,
                                      ),
                                      Text(
                                        recordType.name,
                                        style: AppTextStyles.subHeadlineText
                                            .copyWith(
                                          fontSize: 13.sp,
                                          color: controller.selectedRecordType
                                                      .value?.type ==
                                                  recordType.type
                                              ? AppColors.primaryColor
                                              : AppColors.backArrowColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 46.w),
                                ],
                              ),
                            ));
                      }).toList(),
                    ),
                    SizedBox(height: 21.h),
                    const Divider(thickness: 0),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Record created on",
                            style: AppTextStyles.blackSubtitle),
                        GestureDetector(
                          onTap: () => controller.selectDate(context),
                          child: Padding(
                            padding: EdgeInsets.only(right: 19.w),
                            child: Icon(
                              Icons.edit,
                              color: AppColors.backArrowColor,
                              size: 14.w,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 14.h),
                    Obx(
                      () => Text(
                        controller.formattedDate,
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp),
                      ),
                    ),
                    const Divider(thickness: 0),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Center(
                        child: CustomButton(
                          text: "Upload record",
                          onPressed: () {
                            controller.addRecord();
                            Get.toNamed(AppRoutes.allRecords);
                          },
                        ),
                      ),
                    ),
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
