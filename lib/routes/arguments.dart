import 'package:get/get.dart';

T? getScreenArgs<T>() {
  var args = Get.routing.args;
  return args is T ? args : null;
}
