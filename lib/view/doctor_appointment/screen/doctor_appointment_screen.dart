import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_routes.dart';
import 'package:grad_projectx2/view/doctor_appointment/controller/doctor_appointement_controller.dart';
import 'package:grad_projectx2/view/doctor_appointment/widgets/appointment_for_section.dart';
import 'package:grad_projectx2/view/doctor_appointment/widgets/doctor_appointment_card.dart';
import 'package:grad_projectx2/view/doctor_appointment/widgets/patient_selection_section.dart';
import 'package:grad_projectx2/widgets/custom_app_bar.dart';
import 'package:grad_projectx2/view/custom_background/screen/custom_background.dart';
import 'package:grad_projectx2/widgets/custom_button.dart';

class DoctorAppointmentScreen extends StatelessWidget {
  DoctorAppointmentScreen({super.key});
  final DoctorAppointementController controller =
      Get.put(DoctorAppointementController());

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Column(
        children: [
          const CustomAppBar(title: 'Appointment'),
          Expanded(
              child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DoctorAppointmentCard(),
                SizedBox(
                  height: 30.h,
                ),
                AppointmentForSection(),
                SizedBox(
                  height: 30.h,
                ),
                PatientSelectionSection(),
                SizedBox(
                  height: 18.h,
                ),
                Center(
                  child: CustomButton(
                      text: 'Next',
                      onPressed: () {
                        Get.toNamed(AppRoutes.appointmentDate);
                      }),
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
