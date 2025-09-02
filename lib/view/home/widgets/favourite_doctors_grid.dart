// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import '../../../core/consts/app_colors.dart';
// import '../../../core/consts/app_text_styles.dart';
// import '../favourite_doctors_controller.dart';
//
//
//
// class FavouriteDoctorsGrid extends StatelessWidget {
//   final FavouriteDoctorsController controller;
//   const FavouriteDoctorsGrid({super.key, required this.controller});
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => GridView.builder(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         mainAxisSpacing: 5.h,
//         crossAxisSpacing: 10.w,
//         childAspectRatio: 0.89,
//       ),
//       itemCount: controller.favouriteDoctors.length,
//       itemBuilder: (context, index) {
//         final doc = controller.favouriteDoctors[index];
//         return SizedBox(
//           width: 160.w,
//           height: 180.h,
//           child: Container(
//             decoration: BoxDecoration(
//               color: AppColors.whiteColor,
//
//               boxShadow: [
//                 BoxShadow(
//                   color: AppColors.blackColor.withOpacity(0.05),
//                   blurRadius: 100,
//                   offset: Offset(0, 2),
//                 ),
//               ],
//             ),
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     CircleAvatar(
//                       radius: 36.r,
//                       backgroundImage: AssetImage(doc.image),
//                     ),
//                     SizedBox(height: 12.h),
//                     Text(doc.name, style: AppTextStyles.doctorName.copyWith(fontWeight: FontWeight.w400,fontSize: 15.sp), textAlign: TextAlign.center),
//                     SizedBox(height: 4.h),
//                     Text(
//                       doc.specialty,
//                       style: AppTextStyles.subtitle.copyWith(color: AppColors.primaryColor,fontSize: 12.sp),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//                 Positioned(
//                   top: 10,
//                   right: 10,
//                   child: GestureDetector(
//             //        onTap: () => controller.toggleFavorite(false, index),
//                     child: Icon(
//                       doc.isFavorite.value ? Icons.favorite : Icons.favorite_border,
//                       color: doc.isFavorite.value ? AppColors.ReactColor : AppColors.backArrowColor,
//                       size: 24.sp,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     ));
//   }
// }


