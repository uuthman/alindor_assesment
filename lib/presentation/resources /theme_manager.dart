import 'package:alindor_assessment/app/di.dart';
import 'package:alindor_assessment/presentation/resources%20/styles_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // Text theme
    textTheme: TextTheme(
      displayLarge:
          getSemiBoldStyle(color: $color.textColor, fontSize: $fontSize.s18),
      displayMedium:
          getRegularStyle(color: $color.textColor, fontSize: $fontSize.s16),
      displaySmall:
          getLightStyle(color: $color.textColor, fontSize: $fontSize.s14),
      headlineMedium:
          getRegularStyle(color: $color.textColor, fontSize: $fontSize.s14),
      headlineLarge: getMediumStyle(color: $color.textColor),
      titleMedium:
          getMediumStyle(color: $color.textColor, fontSize: $fontSize.s14),
      titleSmall: getMediumStyle(color: $color.textColor, fontSize: $fontSize.s12),
      bodyMedium: getMediumStyle(color: $color.textColor),
      bodySmall: getRegularStyle(color: $color.textColor),
      bodyLarge: getRegularStyle(color: $color.textColor),
    ),
  );
}
