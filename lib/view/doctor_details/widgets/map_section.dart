import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grad_projectx2/view/doctor_details/controller/doctor_details_controller.dart';
import '../../../../../core/constants/app_colors.dart';

class MapSection extends StatelessWidget {
  const MapSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DoctorDetailsController>();
    return SizedBox(
      child: Stack(
        children: [
          Container(
            width: 335.w,
            height: 210.h,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackColor.withOpacity(0.08),
                  offset: const Offset(0, 0),
                  blurRadius: 30,
                  spreadRadius: 0,
                )
              ],
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Obx(() => GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: controller.currentLocation.value ??
                          LatLng(33.5138, 36.2765),
                      zoom: 14,
                    ),
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
