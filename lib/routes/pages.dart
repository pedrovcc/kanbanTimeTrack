import 'package:get/get.dart';
import 'package:stime_strack/controllers/landing_controller.dart';
import 'package:stime_strack/modules/landing/landing_page.dart';
import 'package:stime_strack/modules/login/login_page.dart';

import '../modules/register/register_page.dart';

List<GetPage> getAppPages() {
  return [
    GetPage<void>(
      name: LandingPage.ROUTE,
      page: () => const LandingPage(),
      binding: BindingsBuilder(() => Get.lazyPut<LandingPageController>(() => LandingPageController())),
    ),
    GetPage<void>(
      name: LoginPage.ROUTE,
      page: () => const LoginPage(),
    ),
    GetPage<void>(
      name: RegisterPage.ROUTE,
      page: () => const RegisterPage(),
    )
  ];
}
