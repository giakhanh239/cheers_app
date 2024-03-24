import 'package:shared_preferences/shared_preferences.dart';

enum _StorageKey { token,identity,address }

class StorageService {
  late SharedPreferences _prefs;
  static final StorageService _service = StorageService._internal();

  StorageService._internal();

  factory StorageService() => _service;

  Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  set saveToken(String value) {
    _prefs.setString(_StorageKey.token.name, value);
  }

  set saveAddress(String value) {
    _prefs.setString(_StorageKey.address.name, value);
  }
  String? get address => _prefs.getString(_StorageKey.address.name);
  String? get token => _prefs.getString(_StorageKey.token.name);

  Future<bool> get deleteToken => _prefs.remove(_StorageKey.token.name);

  set saveIdentity(String value) {
    _prefs.setString(_StorageKey.identity.name, value);
  }

  String? get identity => _prefs.getString(_StorageKey.identity.name);

}
