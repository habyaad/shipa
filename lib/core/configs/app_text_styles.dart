import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipa/core/configs/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();
  static const String fontFamily = 'Inter';

  static TextStyle titleLarge = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.neutralColor600,
    fontFamily: fontFamily,
  );

  static TextStyle titleMedium = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.neutralColor600,
    fontFamily: fontFamily,
  );

  static TextStyle titleSmall = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.neutralColor600,
    fontFamily: fontFamily,
  );

  static TextStyle bodyLarge = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.neutralColor600,
    fontFamily: fontFamily,
  );

  static TextStyle bodyMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.neutralColor600,
    fontFamily: fontFamily,
  );

  static TextStyle bodySmall = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.neutralColor600,
    fontFamily: fontFamily,
  );
}
