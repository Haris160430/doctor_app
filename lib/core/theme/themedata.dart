import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    secondaryHeaderColor: AppColors.secondary ,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.onPrimary,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: AppColors.onPrimary,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(color: AppColors.primary,fontSize: 16,fontWeight: FontWeight.w500),
      titleSmall: TextStyle(color: AppColors.textbody,fontSize: 12,fontWeight: FontWeight.w400),
      titleLarge: TextStyle(color: AppColors.primary,fontWeight: FontWeight.w700,fontSize: 16),
      bodyLarge: TextStyle(color: AppColors.onSurface,fontWeight: FontWeight.w700,fontSize: 16),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(AppColors.primary),  // Set your color here
        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
      )
    ),
    navigationBarTheme: NavigationBarThemeData(
      labelTextStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
        color: Colors.white,  // Set label text color to white
        fontSize: 14,
        fontWeight: FontWeight.w500,
      )),
    ),


    // You can define other components like button themes if needed

  );
}
