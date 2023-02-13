import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stime_strack/modules/login/login_page.dart';
import 'package:stime_strack/routes/pages.dart';

import 'core/theme/app_theme.dart';
import 'core/utils/global_bindings.dart';

class KanbanTimeTrack extends StatefulWidget {
  final String? initialRoute;
  final GlobalBindings? globalBindings;

  const KanbanTimeTrack({super.key,
    this.initialRoute,
    this.globalBindings,
  });

  @override
  _KanbanTimeTrackState createState() => _KanbanTimeTrackState();
}

class _KanbanTimeTrackState extends State<KanbanTimeTrack> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      locale: Get.deviceLocale,
      enableLog: true,
      debugShowCheckedModeBanner: false,
      title: 'Kanban Time Track',
      initialRoute: widget.initialRoute ?? LoginPage.ROUTE,
      initialBinding: widget.globalBindings ?? GlobalBindings(),
      getPages: getAppPages(),
      theme: createTheme(),
      themeMode: ThemeMode.light,
    );
  }
}


