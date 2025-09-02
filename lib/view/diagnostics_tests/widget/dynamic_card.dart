import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_projectx2/core/constants/app_colors.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';

class DynamicCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String testCountText;
  final String imageUrl;
  final String price;
  final String discountedPrice;
  final String discountLabel;
  final String cashbackText;
  final VoidCallback onBookNow;

  const DynamicCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.testCountText,
    required this.imageUrl,
    required this.price,
    required this.discountedPrice,
    required this.discountLabel,
    required this.cashbackText,
    required this.onBookNow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(6.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 20,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.cardTitle),
                SizedBox(height: 6.h),
                Text(subtitle, style: AppTextStyles.cardSubtitle),
                SizedBox(height: 18.h),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 17.w, vertical: 9.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Text(
                    testCountText,
                    style: AppTextStyles.testCountButtonText,
                  ),
                ),
                SizedBox(height: 18.h),
              ],
            ),
          ),

          // Image
          ClipRRect(
            borderRadius:
                BorderRadius.circular(6.r),
            child: Image.asset(
              imageUrl,
              width: double.infinity,
              height: 220.h,
              fit: BoxFit.cover,
            ),
          ),

          // Prices and Book Button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 23.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(price, style: AppTextStyles.cardPrice),
                          SizedBox(width: 8.w),
                          Text(discountedPrice,
                              style: AppTextStyles.cardDiscountedPrice),
                          SizedBox(width: 6.w),
                          Text(discountLabel,
                              style: AppTextStyles.subHeadlineText),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Text(cashbackText, style: AppTextStyles.cashBackText),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: onBookNow,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    padding:
                        EdgeInsets.symmetric(horizontal: 27.w, vertical: 9.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                  child: Text('Book Now', style: AppTextStyles.bookButtonText),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
