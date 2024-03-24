import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:freelance/service/api/api_path.dart';

class ApiProvider {
  final dio = Dio();


  static Future<String?> getEnvironmentKey() async {
    final env = await parseStringToMap(assetsFileName: '.env');
    return env['API_KEY'];
  }

  static Future<String> getEnvironmentKeyByName({
    required String keyName,
  }) async {
    final env = await parseStringToMap(assetsFileName: '.env');
    return env[keyName] ?? '';
  }

  static Future<Map<String, String>> parseStringToMap({
    String assetsFileName = '.env',
  }) async {
    final lines = await rootBundle.loadString(assetsFileName);
    final environment = <String, String>{};
    for (var line in lines.split('\n')) {
      line = line.trim();
      if (line.contains('=') && !line.startsWith(RegExp(r'=|#'))) {
        final contents = line.split('=');
        environment[contents[0]] = contents.sublist(1).join('=');
      }
    }
    return environment;
  }
}
