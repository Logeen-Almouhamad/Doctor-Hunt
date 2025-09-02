import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/view/home/controller/home_controller.dart';
import 'package:grad_projectx2/widgets/featured_doctors.dart';


class FeaturedDoctorsList extends StatelessWidget {
  final HomeScreenController controller;
  const FeaturedDoctorsList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
      height: 130.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.featuredDoctors.length,
        separatorBuilder: (_, __) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          final doc = controller.featuredDoctors[index];
          return FeaturedDoctorCard(
            imageUrl: doc.image,
            name: doc.name,
            salary: doc.salary,
            rating: doc.rating ,
            isFavorite: doc.isFavorite.value,
            onFavoriteTap: () => controller.toggleFavorite(index),

          );
        },
      ),
    ));
  }
}