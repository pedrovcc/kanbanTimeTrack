import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> initDeviceOrientation() {
  return SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

bool isDeviceSmallerThan360dp() => Get.mediaQuery.size.width < 360;

bool isDeviceSmallerThan600dp() => Get.mediaQuery.size.width < 600;

bool isDeviceSmallerThan905dp() => Get.mediaQuery.size.width < 905;

double getDefaultEdgePaddingByDevice() {
  return isDeviceSmallerThan600dp()
      ? 16.toDouble()
      : isDeviceSmallerThan905dp()
      ? 32.toDouble()
      : getScaledEdgePadding();
}

double getScaledEdgePadding() => (Get.mediaQuery.size.width * 0.5 - 419.5).floorToDouble();

double getDefaultVerticalPaddingByDevice() => (isDeviceSmallerThan600dp() ? 24 : 32).toDouble();

double getAppBarActionIconRightPadding() => (isDeviceSmallerThan600dp() ? 0 : 8).toDouble();

double getDefaultLogoOuterPaddingByDevice() => (isDeviceSmallerThan600dp() ? 16 : 48).toDouble();
