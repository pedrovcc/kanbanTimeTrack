import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:get/get.dart';

import '../core/theme/app_colors.dart';

Future<SnackBarClosedReason> showSnackbar(
  BuildContext context, {
  required Widget content,
}) {
  final scaffoldMessenger = ScaffoldMessenger.of(context)..hideCurrentSnackBar();
  return scaffoldMessenger
      .showSnackBar(
        SnackBar(
          content: content,
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppColors.blackHoverOverlay,
          elevation: 8,
        ),
      )
      .closed;
}

void showGetSnackbar({
  required String text,
  String? buttonText,
  SnackPosition position = SnackPosition.BOTTOM,
  Duration duration = const Duration(seconds: 2),
  Color? backgroundColor,
}) {
  if (Get.isSnackbarOpen) Get.back<void>();

  Future.delayed(const Duration(milliseconds: 380), () => SemanticsService.announce(text, TextDirection.ltr));

  Get.rawSnackbar(
    snackPosition: position,
    duration: duration,
    borderRadius: 4,
    backgroundColor: backgroundColor ?? Get.theme.colorScheme.onSecondary,
    margin: const EdgeInsets.fromLTRB(8, 0, 8, 16),
    padding: const EdgeInsets.all(16),
    messageText: Text(text,
        style: Get.theme.textTheme.bodyText1!.copyWith(
          color: Colors.white,
        )),
    mainButton: buttonText == null
        ? null
        : TextButton(
            child: Text(buttonText, style: Get.theme.textTheme.bodySmall!.copyWith(color: Colors.white)),
            onPressed: () => Get.back<void>(),
          ),
  );
}
