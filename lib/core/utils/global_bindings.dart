import 'package:get/get.dart';

import '../../controllers/landing_controller.dart';

class GlobalBindings extends Bindings {

  @override
  void dependencies() {
    // Controllers
    Get.put(LandingPageController());
  }
}
