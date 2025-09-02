import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';
import 'package:grad_projectx2/view/doctor_appointemet_date/widgets/available_time_section.dart';
import 'package:grad_projectx2/view/doctor_appointemet_date/widgets/custom_calendar_header.dart';
import 'package:grad_projectx2/view/doctor_appointemet_date/widgets/reminder_section.dart';
import 'package:grad_projectx2/view/doctor_appointemet_date/widgets/thank_you_modal.dart';
import 'package:grad_projectx2/view/doctor_appointment/controller/doctor_appointement_controller.dart';
import 'package:grad_projectx2/widgets/custom_app_bar.dart';
import 'package:grad_projectx2/view/custom_background/screen/custom_background.dart';
import 'package:grad_projectx2/widgets/custom_button.dart';
import 'package:table_calendar/table_calendar.dart';

class DoctorAppointementDateScreen extends StatelessWidget {
  const DoctorAppointementDateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DoctorAppointementController>();
    return CustomBackground(
      child: Column(
        children: [
          const CustomAppBar(title: 'Appointment'),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 335.w,
                      height: 280.h,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.sp),
                            topRight: Radius.circular(8.sp)),
                      ),
                      child: Obx(
                        () => Column(
                          children: [
                            CustomCalendarHeader(
                              focusedDay: controller.selectedDay.value,
                              onLeftArrow: controller.previousMonth,
                              onRightArrow: controller.nextMonth,
                              backgroundColor: AppColors.primaryColor,
                            ),
                            ClipRect(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: SizedBox(
                                    height: 200.h,
                                    child: TableCalendar(
                                      firstDay: DateTime.utc(2020, 1, 1),
                                      lastDay: DateTime.utc(2030, 12, 31),
                                      focusedDay: controller.selectedDay.value,
                                      startingDayOfWeek:
                                          StartingDayOfWeek.monday,
                                      selectedDayPredicate: (day) => isSameDay(
                                          day, controller.selectedDay.value),
                                      onDaySelected: (selectedDay, focusedDay) {
                                        controller.selectDay(selectedDay);
                                      },
                                      headerVisible: false,
                                      calendarStyle: CalendarStyle(
                                        todayDecoration: BoxDecoration(
                                          color: AppColors.primaryColor
                                              .withOpacity(0.2),
                                          shape: BoxShape.circle,
                                        ),
                                        selectedDecoration: const BoxDecoration(
                                          color: AppColors.primaryColor,
                                          shape: BoxShape.circle,
                                        ),
                                        selectedTextStyle:
                                            AppTextStyles.slotTime.copyWith(
                                                color: AppColors.whiteColor),
                                        defaultTextStyle: AppTextStyles.calendar
                                            .copyWith(
                                                color: AppColors.blackColor),
                                        weekendTextStyle: AppTextStyles.calendar
                                            .copyWith(
                                                color: AppColors.blackColor),
                                        outsideDaysVisible: false,
                                        cellMargin: EdgeInsets.zero,
                                        cellPadding: EdgeInsets.zero,
                                      ),
                                      daysOfWeekStyle: DaysOfWeekStyle(
                                        weekdayStyle: AppTextStyles.calendar
                                            .copyWith(
                                                color: AppColors.blackColor),
                                        weekendStyle: AppTextStyles.calendar
                                            .copyWith(
                                                color: AppColors.blackColor),
                                        decoration: const BoxDecoration(
                                          color: AppColors.whiteColor,
                                          border: Border(
                                            bottom: BorderSide(
                                              color: AppColors.lineColor,
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                        // 👇 This formats day names as "MO", "TU", etc.
                                        dowTextFormatter: (date, locale) =>
                                            _getShortWeekday(date.weekday),
                                      ),
                                      daysOfWeekHeight: 40.h,
                                      rowHeight: 30.h,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  Container(
                    height: 409.h,
                    margin: const EdgeInsets.only(top: 30),
                    padding: const EdgeInsets.only(top: 5, left: 20, right: 10),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45.r),
                        topRight: Radius.circular(45.r),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 25,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AvailableTimeSection(controller: controller),
                        SizedBox(height: 32.h),
                        ReminderSection(controller: controller),
                        SizedBox(height: 10.h),
                        Center(
                          child: CustomButton(
                            text: 'Confirm',
                            onPressed: () {
                              showDialog(
                                context: Get.context!,
                                barrierDismissible: false,
                                barrierColor: AppColors.backColor,
                                builder: (context) => ThankYouModal(
                                  onDone: () => Get.back(),
                                  onEdit: () => Get.back(),
                                  doctorName: 'Pediatracian Purpeison',
                                  date: 'February 21',
                                  time: '02:00',
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getShortWeekday(int weekday) {
    const shortDays = ['MO', 'TU', 'WE', 'TH', 'FR', 'SA', 'SU'];
    return shortDays[(weekday - 1) % 7];
  }
}
