import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_demo/infrastructure/commons/constants/storage_constants.dart';

class SharedPreferenceService {
  static SharedPreferenceService? _instance;
  static SharedPreferences? _preferences;

  static Future<SharedPreferenceService> getInstance() async {
    _instance ??= SharedPreferenceService();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  // General Methods: ----------------------------------------------------------

  static clearPreference() async {
    await getInstance();
    await _preferences!.clear();
  }

  static Future<void> saveValue(String key, String value) async {
    await getInstance();
    await _preferences!.setString(key, value);
  }

  static Future<String> getValue(String key) async {
    await getInstance();
    try {
      return _preferences!.getString(key) ?? "";
    } catch (e) {
      return '';
    }
  }

  static Future<void> removeValue(String key) async {
    await getInstance();
    try {
      await _preferences!.remove(key);
    } catch (e) {
      if (kDebugMode) {
        print("remove value : ${e.runtimeType.toString()}");
      }
    }
  }

  static Future<bool> checkIsKeyAvailable(String key) async {
    await getInstance();
    return _preferences!.containsKey(key);
  }

  //token
  static Future<String> get getAuthToken async {
    await getInstance();
    return _preferences!.getString(StorageConstants.userIdConstant) ?? "";
  }

  static Future<void> saveAuthToken(String authToken) async {
    await getInstance();
    await _preferences!.setString(StorageConstants.userIdConstant, authToken);
  }

  //version number
  static Future<String> get getVersionNumber async {
    await getInstance();
    return _preferences!.getString(StorageConstants.versionNumberKey) ?? "";
  }

  static Future<void> saveVersionNumber(String versionNumberKey) async {
    await getInstance();
    await _preferences!
        .setString(StorageConstants.versionNumberKey, versionNumberKey);
  }

  static Future<void> saveVisit(bool visitBool) async {
    await getInstance();
    await _preferences!.setBool(StorageConstants.visitBoolean, visitBool);
  }

  static Future<bool> get getVisitBool async {
    await getInstance();
    return _preferences!.getBool(StorageConstants.visitBoolean) ?? false;
  }

  static Future<void> saveLoggedIn(bool isLoggedIn) async {
    await getInstance();
    await _preferences!.setBool(StorageConstants.isLoggedIn, isLoggedIn);
  }

  static Future<bool> get getLoggedIn async {
    await getInstance();
    return _preferences!.getBool(StorageConstants.isLoggedIn) ?? false;
  }

  static Future<void> removeAuthToken() async {
    await getInstance();
    await _preferences!.remove(StorageConstants.userIdConstant);
  }
}
