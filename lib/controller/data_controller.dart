import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wob/types/store_details.dart';
import 'package:wob/types/user_data.dart';

class DataController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool darkMode = false;
  UserModule? userModule;
  int distanceStore = 0;
  @override
  void onInit() async {
    getThemeStatus();
    super.onInit();
  }

  saveThemeStatus(bool darkMode) async {
    SharedPreferences pref = await _prefs;
    pref.setBool('darkMode', darkMode);
    getThemeStatus();
  }

  getThemeStatus() async {
    SharedPreferences pref = await _prefs;
    bool _darkMode = pref.getBool('darkMode') ?? false;
    Get.changeThemeMode(_darkMode ? ThemeMode.dark : ThemeMode.light);
    darkMode = _darkMode;
    update();
  }

  setUserModule(UserModule userModule) async {
    SharedPreferences pref = await _prefs;
    this.userModule = userModule;
    pref.setString('userModule', userModuleToJson(userModule));
    update();
  }

  List<StoreDetails> storeDetails = [];
  String lastPlaceDetails = "13.081476,80.209614";
  setStoreDetails(Map storeDetails) {
    List keys = storeDetails.keys.toList();
    for (var i = 0; i < keys.toList().length; i++) {
      this
          .storeDetails
          .add(StoreDetails.fromJson(storeDetails[keys[i]], keys[i]));
    }
    update();
  }

  setLastPlaceDetails(String lastPlaceDetails) {
    this.lastPlaceDetails =
        lastPlaceDetails.replaceAll("\"", "").replaceAll(" ", "");
    update();
  }
}
