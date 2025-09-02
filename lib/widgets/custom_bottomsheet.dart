import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:grad_projectx2/core/constants/app_images.dart';
import 'package:grad_projectx2/core/constants/app_text_styles.dart';

class MyBottomSheetContent extends StatelessWidget {
  final VoidCallback? onClose;

  MyBottomSheetContent({this.onClose});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (onClose != null) onClose!();
        return true; // يسمح بالإغلاق
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {},
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Colors.white,
          ),
          height: 250.h,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: 20.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: Container(
                      color: Color.fromRGBO(196, 196, 196, 1),
                      width: 130,
                      height: 3,
                    ),
                  ),
                  SizedBox(
                    height: 29.h,
                  ),
                  Text(
                    "Add a record",
                    style: AppTextStyles.headlineText,
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(AppImages.takePhotoIcon,
                          height: 15.h,
                          width: 15.w,
                          color: Color.fromRGBO(103, 114, 148, 1)),
                      SizedBox(
                        width: 13.w,
                      ),
                      Text(
                        "Take a photo",
                        style: AppTextStyles.blackSubtitle.copyWith(
                            color: Color.fromRGBO(103, 114, 148, 1)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 21.h,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(AppImages.uploadFromGalleryIcon,
                          height: 15.h,
                          width: 15.w,
                          color: Color.fromRGBO(103, 114, 148, 1)),
                      SizedBox(
                        width: 13.w,
                      ),
                      Text("Upload from gallery",
                          style: AppTextStyles.blackSubtitle.copyWith(
                              color: Color.fromRGBO(103, 114, 148, 1)))
                    ],
                  ),
                  SizedBox(
                    height: 23.h,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(AppImages.uploadFilesIcon,
                          height: 15.h,
                          width: 15.w,
                          color: Color.fromRGBO(103, 114, 148, 1)),
                      SizedBox(
                        width: 13.w,
                      ),
                      Text(
                        "Upload files",
                        style: AppTextStyles.blackSubtitle.copyWith(
                            color: Color.fromRGBO(103, 114, 148, 1)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 43.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
