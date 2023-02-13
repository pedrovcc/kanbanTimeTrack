import 'package:flutter/material.dart';

import 'app_colors.dart';

ColorScheme createColorScheme() {
  return ColorScheme(
    primary: AppColors.blueWarmVivid70,
    secondary: AppColors.blueWarmVivid50,
    background: AppColors.whiteHighEmphashis,
    surface: AppColors.whiteSurface,
    error: AppColors.redError,
    onPrimary: AppColors.whiteHighEmphashis,
    onSecondary: AppColors.whiteHighEmphashis,
    onBackground: AppColors.blackSurface,
    onSurface: AppColors.blackSurface,
    onError: AppColors.whiteHighEmphashis,
    brightness: Brightness.light,
  );
}
