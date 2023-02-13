import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/theme/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final bool isDisabled;

  const PrimaryButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.isDisabled = false, Color? color,
  }) : super(key: key);

  factory PrimaryButton.icon({
    Key? key,
    required Widget icon,
    required Widget label,
    VoidCallback? onPressed,
  }) =>
      PrimaryButton(
        key: key,
        onPressed: onPressed,
        child: Row(
          children: [
            icon,
            const SizedBox(width: 8),
            label,
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ElevatedButton(
          style: ButtonStyle(
            animationDuration: const Duration(milliseconds: 200),
            backgroundColor: MaterialStateProperty.all(isDisabled ? AppColors.blackDisabled : AppColors.grey60),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
            splashFactory: isDisabled ? NoSplash.splashFactory : null,
            overlayColor: isDisabled ? MaterialStateProperty.all(Colors.transparent) : null,
          ),
          onPressed: onPressed,
          child: IconTheme.merge(
            data: IconThemeData(color: isDisabled ? AppColors.whiteDisabled : Colors.white),
            child: DefaultTextStyle.merge(
              child: child,
              style: Get.textTheme.subtitle1?.copyWith(color: AppColors.whiteMediumEmphashis),
            ),
          ),
        ));
  }
}
