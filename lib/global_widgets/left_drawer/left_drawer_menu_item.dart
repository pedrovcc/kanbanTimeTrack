import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeftDrawerMenuItem extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData icon;
  final Widget? trailing;
  final Color? iconColor;
  final Color? labelColor;

  const LeftDrawerMenuItem({super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.iconColor,
    this.trailing,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.mediaQuery.size.width;

    return InkWell(
      splashColor: Get.theme.colorScheme.primary.withOpacity(0.20),
      highlightColor: Colors.transparent,
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.only(left: 20.0, top: 5.0),
        constraints: BoxConstraints(minHeight: 48, maxHeight: Get.mediaQuery.textScaleFactor > 1.5 ? screenWidth * 0.6 : screenWidth),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              width: 23,
              child: IconButton(
                icon: const Icon(Icons.arrow_back), onPressed: () {Get.back();},
              ),
            ),
            const SizedBox(width: 26.0),
            Flexible(
              flex: 8,
              child: Text(
                label.replaceAll('', '\u00A0'),
                style: Get.textTheme.titleMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            trailing ?? Container(),
          ],
        ),
      ),
    );
  }
}
