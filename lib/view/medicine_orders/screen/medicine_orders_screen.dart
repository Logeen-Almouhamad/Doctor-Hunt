import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:grad_projectx2/view/custom_background/screen/custom_background.dart';
import 'package:grad_projectx2/view/medicine_orders/controller/medicine_orders_controller.dart';
import 'package:grad_projectx2/widgets/custom_app_bar.dart';
import 'package:grad_projectx2/widgets/custom_search_bar.dart';

class MedicineOrdersScreen extends StatelessWidget {
  MedicineOrdersScreen({super.key});
  final MedicineOrdersController controller =
      Get.put(MedicineOrdersController());

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Column(
        children: [
          //app bar
          const CustomAppBar(title: "Medicines orders"),
          //Search bar
          const CustomSearchBar(
            hintText: 'search',
          ),
          //Menu option cards
          Obx(
            () => Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                child: GridView.builder(
                  itemCount: controller.medicalCategories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.w,
                    mainAxisSpacing: 15.h,
                    childAspectRatio: 1.0,
                  ),
                  itemBuilder: (context, index) {
                    final orderMenu = controller.medicalCategories[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(8.r),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 0),
                            color: AppColors.blackColor.withOpacity(0.08),
                            spreadRadius: 0,
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      height: 160.h,
                      width: 160.w,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              orderMenu['image']!,
                              height: 76.h,
                              width: 76.w,
                            ),
                            SizedBox(height: 13.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Text(
                                orderMenu['title']!,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.backArrowColor,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 30.h,),
        ],
      ),
    );
  }
}
