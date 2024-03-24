import 'package:flutter/material.dart';
import 'package:freelance/config/environment.dart';
import 'package:freelance/modules/app.dart';
import 'package:freelance/service/phantom/phantom.dart';
import 'package:freelance/service/shared_data/storage_service.dart';

void runMainApp(EnvironmentType environmentType) async {
  WidgetsFlutterBinding.ensureInitialized();
  StorageService().init();
  Phantom().init();
  runApp(const MyApp());
}
