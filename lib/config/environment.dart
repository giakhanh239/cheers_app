import 'dart:io';


enum EnvironmentType { development, production, staging }

abstract class EnvironmentBase {
  String get host;

  String get name;

  int get apiTimeout => 20000;

}

class _Development extends EnvironmentBase {
  @override
  String get host => 'http://44.215.59.169';

  @override
  String get name => EnvironmentType.development.name;



}

class _Staging extends EnvironmentBase {
  @override
  String get host => '';

  @override
  String get name => EnvironmentType.staging.name;
}

class _Production extends EnvironmentBase {
  @override
  String get host => '';

  @override
  String get name => EnvironmentType.production.name;
}

class Environment {
  static  EnvironmentBase _environment = _Development();

  static String get host => _environment.host;


  static String get name => _environment.name;

  static int get apiTimeout => _environment.apiTimeout;


  static void config(EnvironmentType type) {
    switch (type) {
      case EnvironmentType.development:
        _environment = _Development();
        break;
      case EnvironmentType.production:
        _environment = _Production();
        break;
      case EnvironmentType.staging:
        _environment = _Staging();
        break;
    }
  }
}

