import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';

class CustomCalendarHeader extends StatelessWidget {
  final DateTime focusedDay;
  final VoidCallback onLeftArrow;
  final VoidCallback onRightArrow;
  final Color backgroundColor;
  final TextStyle? textStyle;

  const CustomCalendarHeader({
    Key? key,
    required this.focusedDay,
    required this.onLeftArrow,
    required this.onRightArrow,
    this.backgroundColor = const Color(0xFF20C997),
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: 335.w,
              height: 52.h,
              alignment: Alignment.centerLeft,
              child: Text(
                DateFormat.yMMMM('en').format(focusedDay),
                style: AppTextStyles.calendarMonthTitle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: onLeftArrow,
                child: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 15),
              ),
              SizedBox(width: 20,),

              GestureDetector(
                onTap: onRightArrow,
                child: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 15),
              ),
            ],
          )
        ],
      ),
    );
  }
} 