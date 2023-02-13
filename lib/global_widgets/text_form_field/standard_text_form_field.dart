import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../core/theme/app_colors.dart';

class StandardTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final Icon icon;
  final bool isPasswordType;

  const StandardTextField({super.key,
    required this.isPasswordType,
    required this.icon,
    required this.labelText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
      return TextField(
          controller: controller,
          obscureText: isPasswordType,
          enableSuggestions: !isPasswordType,
          focusNode: FocusNode(),
          autocorrect: !isPasswordType,
          style: Get.textTheme.bodyText1?.copyWith(fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            suffixIcon: isPasswordType ? icon : IconButton(onPressed: () {}, icon: icon),
            labelText: labelText,
            labelStyle: const TextStyle(color: AppColors.whiteSmoke),
            filled: true,
            fillColor: Colors.transparent,
            border: OutlineInputBorder(
              borderSide: const BorderSide(style: BorderStyle.solid, width: 1.2, color: AppColors.whiteSmoke),
              borderRadius: BorderRadius.circular(8.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(style: BorderStyle.solid, width: 1.2, color: AppColors.whiteSmoke),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          keyboardType: isPasswordType ? TextInputType.visiblePassword : TextInputType.emailAddress,
          maxLines: 1,
          cursorColor: AppColors.whiteSurface,
        );
  }
}