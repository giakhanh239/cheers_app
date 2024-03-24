import 'package:freelance/modules/auth/controller/auth_controller.dart';
import 'package:freelance/service/phantom/phantom.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => AuthController());
  }
}
