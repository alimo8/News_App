import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:n_news_app/core/styles/app_text_styles.dart';

class CustomCategoryItemWidget extends StatelessWidget {
  const CustomCategoryItemWidget({super.key, required this.title, this.onTap});
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
        margin: EdgeInsets.only(right: 16.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffE9EEFA), width: 1),
          borderRadius: BorderRadius.circular(56.r),
          color: Colors.transparent,
        ),
        child: Text(title, style: AppTextStyles.black14Medium),
      ),
    );
  }
}
