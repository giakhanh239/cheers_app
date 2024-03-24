import 'package:flutter/material.dart';
import 'package:freelance/common/global_loading/global_loading.dart';
import 'package:freelance/models/user.dart';
import 'package:freelance/models/wallet.dart';
import 'package:freelance/repository/user_repository/auth_repository.dart';
import 'package:freelance/routes/routes.dart';
import 'package:freelance/service/phantom/phantom.dart';
import 'package:freelance/service/shared_data/storage_service.dart';
import 'package:freelance/util/enum.dart';
import 'package:get/get.dart';

class AuthController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController =
      Get.put(TabController(length: 2, vsync: this));
  Wallet wallet = Wallet();
  UserRole userRole = UserRole.freelancer;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Phantom().resultStream.listen((walletData) {
      String walletStatus = walletData[0];
      if (walletStatus == "onConnect") {
        wallet.address = walletData[1];
        if (wallet.address != null) {
          StorageService().saveAddress = wallet.address!;
        }
        Phantom().signMessage();
      } else {
        wallet.signature = walletData[1];
        wallet.message = walletData[2];
        onAuthWallet();
      }
    });
  }

  Future<void> onConnectWallet() async {
    Phantom().connectToWallet();
  }

  Future<void> onAuthWallet() async {
    LoadingController.instance.show();
    Wallet wallet = this.wallet;
    try {
      final data = await AuthRepository.auth(wallet);
      _extractData(data, userRole);
      LoadingController.instance.hide();
    } catch (e) {
      print(e);
      LoadingController.instance.hide();
    }
  }

  void _extractData(data, UserRole userRole) {
    StorageService().saveToken = data['token'];
    User user = User.fromJson(data['user']);

    LoadingController.instance.hide();
    if (user.role == null) {
      Get.toNamed(RouteName.registerInfoScreen, arguments: userRole);
    }
    Get.offAllNamed(userRole == UserRole.freelancer
        ? RouteName.mainDashboardClientScreen
        : RouteName.mainDashboardProviderScreen);
  }
}
