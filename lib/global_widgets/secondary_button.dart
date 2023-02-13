import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/theme/app_colors.dart';

class SecondaryButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;

  const SecondaryButton({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  factory SecondaryButton.icon({
    Key? key,
    required Widget icon,
    required Widget label,
    required VoidCallback? onPressed,
  }) =>
      SecondaryButton(
        key: key,
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            label,
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 50),
        child: MaterialButton(
          animationDuration: const Duration(seconds: 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          elevation: 0,
          highlightColor: Colors.transparent,
          onPressed: onPressed,
          splashColor: AppColors.grey20,
          disabledColor: AppColors.blackDisabled,
          disabledTextColor: AppColors.whiteDisabled,
          child: IconTheme.merge(
            data: const IconThemeData(color: Colors.white, size: 12),
            child: DefaultTextStyle.merge(
              child: child,
              style: Get.textTheme.button!.copyWith(color: AppColors.grey80)
            ),
          ),
        ),
      );
  }
}
