import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

abstract class AppTextStyles {
  const AppTextStyles._();

  static const String figtreeRegularFont = 'FigtreeRegular';
  static const String figtreeSemiFont = 'figtreeSemiBold';
  static const String figtreeExtraFont = 'figtreeExtraBold';

  static TextStyle figtreeRegular = TextStyle(
      fontFamily: figtreeRegularFont,
      //fontWeight: FontWeight.w600,
      //fontStyle: FontStyle.normal,
      //fontSize: 48.sp,
      color: AppColors.textColor4
  );

  static TextStyle figtreeSemiBold = TextStyle(
      fontFamily: figtreeSemiFont,
      //fontWeight: FontWeight.w600,
      //fontStyle: FontStyle.normal,
      //fontSize: 48.sp,
      color: AppColors.iconText
  );

  static TextStyle figtreeExtraBold = TextStyle(
      fontFamily: figtreeExtraFont,
      //fontWeight: FontWeight.w600,
      //fontStyle: FontStyle.normal,
      //fontSize: 48.sp,
      color: AppColors.textColor4
  );

}
