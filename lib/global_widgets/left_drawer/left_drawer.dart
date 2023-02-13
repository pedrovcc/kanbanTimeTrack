import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stime_strack/global_widgets/snackbar.dart';
import '../../core/theme/app_colors.dart';
import '../../modules/landing/landing_page.dart';
import 'left_drawer_menu_item.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.textTheme;

    return Drawer(
      child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 40, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      transform: Matrix4.translationValues(-13, 0, 0),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: Get.back,
                        color: AppColors.blackHighEmphashis,
                        tooltip: 'Voltar',
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 24.0, bottom: 10.0),
                child: Divider(thickness: 2),
              ),
              buildActions(context, textTheme),
            ],
          ),
      );
  }

  Widget buildActions(BuildContext context, TextTheme textTheme) {
    final listItems = [
      LeftDrawerMenuItem(
        icon: Icons.view_kanban,
        label: 'Board',
        onPressed: () {
          Get.toNamed(LandingPage.ROUTE);
        },
      ),
      LeftDrawerMenuItem(
        icon: Icons.archive_outlined,
        label: 'Projects',
        onPressed: () {
          Get.back();
          showSnackbar(context, content: const Text('Feature on development'));
        },
      ),
      LeftDrawerMenuItem(
        icon: Icons.person,
        label: 'Profile',
        onPressed: () {
          Get.back();
          showSnackbar(context, content: const Text('Feature on development'));
        },
      ),
      LeftDrawerMenuItem(
          icon: Icons.logout,
          label: 'Quit',
          onPressed: () {
            Get.back();
            showSnackbar(context, content: const Text('Feature on development'));
          }),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...listItems.map(
              (item) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: InkWell(
              splashColor: AppColors.blueWarmVivid70.withOpacity(.44),
              onTap: item.onPressed,
              child: Container(
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Icon(
                      item.icon,
                      color: item.iconColor ?? AppColors.grey70,
                      size: 24,
                    ),
                    const SizedBox(width: 34),
                    Text(
                      item.label,
                      style: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w500, color: item.labelColor ?? AppColors.grey90),
                    ),
                    Container(margin: const EdgeInsets.only(bottom: 8), child: item.trailing ?? Container()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );}
  }
