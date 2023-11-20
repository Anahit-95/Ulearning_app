import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulearning_app/common/models/entities.dart';
import 'package:ulearning_app/common/utils/contsants.dart';

class StorageService {
  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  String getString(String key) {
    return _prefs.getString(key) ?? '';
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  bool getDeviceFirstOpen() {
    return _prefs.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME) ?? false;
  }

  bool isLoggedIn() {
    return _prefs.getString(AppConstants.STORAGE_USER_PROFILE_KEY) != null
        ? true
        : false;
  }

  UserProfile getUserProfile() {
    var profile = _prefs.getString(AppConstants.STORAGE_USER_PROFILE_KEY) ?? '';
    var profileJson = jsonDecode(profile);
    var userProfile = UserProfile.fromJson(profileJson);
    return userProfile;
  }
}
