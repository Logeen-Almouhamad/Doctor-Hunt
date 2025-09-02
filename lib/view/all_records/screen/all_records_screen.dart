import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:grad_projectx2/core/constants/app_routes.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';
import 'package:grad_projectx2/view/add_record/controller/add_record_controller.dart';
import 'package:grad_projectx2/view/add_record/screen/add_record_screen.dart';
import 'package:grad_projectx2/view/custom_background/screen/custom_background.dart';
import 'package:grad_projectx2/widgets/custom_app_bar.dart';
import 'package:grad_projectx2/widgets/custom_button.dart';

class AllRecordsScreen extends StatelessWidget {
  AllRecordsScreen({super.key});
  final AddRecordController controller = Get.put(AddRecordController());

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: SafeArea(
        child: Column(
          children: [
            //appbar
            const CustomAppBar(title: "All Records"),

            //added records  Cards list
            Expanded(
              child: Obx(
                () {
                  return controller.allMedicalRecords.isEmpty
                      ? Center(
                          child: Text(
                            "No records yet",
                            style: AppTextStyles.subtitle,
                          ),
                        )
                      : ListView.builder(
                          itemCount: controller.allMedicalRecords.length,
                          itemBuilder: (context, index) {
                            final record = controller.allMedicalRecords[index];

                            final List<String> dateParts =
                                record.date.split(' ');
                            String displayDate = '';

                            if (dateParts.length >= 2) {
                              displayDate =
                                  ''' ${dateParts[0]}\n${dateParts[1]}''';
                            } else {
                              displayDate = record.date;
                            }

                            ///////Record Card
                            return Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      offset: Offset(0, 0),
                                      color: Color.fromRGBO(19, 9, 9, 0.078),
                                      spreadRadius: 0,
                                      blurRadius: 20,
                                    ),
                                  ],
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                width: 335.w,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ///date and new text
                                        Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  14.w, 14.h, 12.w, 5.h),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: AppColors.primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.r),
                                                ),
                                                width: 55.w,
                                                height: 60.h,
                                                child: Center(
                                                  child: Text(
                                                    displayDate,
                                                    style: AppTextStyles
                                                        .buttonText
                                                        .copyWith(
                                                      color:
                                                          AppColors.whiteColor,
                                                      fontSize: 15.sp,
                                                      height: 1.2,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  14.w, 1.h, 12.w, 8.h),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: const Color.fromRGBO(
                                                      14, 190, 127, 0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.r),
                                                ),
                                                width: 55.w,
                                                height: 22.h,
                                                child: Center(
                                                    child: Text("NEW",
                                                        style: AppTextStyles
                                                            .subHeadlineText
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize:
                                                                    12.sp))),
                                              ),
                                            ),
                                          ],
                                        ),

                                        //text information
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              0.w, 26.h, 0.w, 23.h),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Record added by you",
                                                style: AppTextStyles.subtitle
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors
                                                            .blackColor),
                                              ),
                                              Text(
                                                "Record for ${record.name}",
                                                style: AppTextStyles
                                                    .subHeadlineText
                                                    .copyWith(fontSize: 13),
                                              ),
                                              SizedBox(height: 8.h,),
                                              Text(
                                                "1 ${record.type.capitalizeFirst}",
                                                style: AppTextStyles.gridText
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color: AppColors
                                                            .titleColor,
                                                        fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),

                                    ////icon menu
                                    Padding(
                                      padding: EdgeInsets.only(top: 10.0.h),
                                      child: Icon(
                                        Icons.more_vert,
                                        size: 30,
                                        color: AppColors.backArrowColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                },
              ),
            ),

            //Add a record button
            CustomButton(
              onPressed: () {
                Get.toNamed(AppRoutes.medicalRecords);
              },
              text: "Add a record",
            ),
            SizedBox(
              height: 50.h,
            )
          ],
        ),
      ),
    );
  }
}
