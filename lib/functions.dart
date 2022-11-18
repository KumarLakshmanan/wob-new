import 'dart:convert';
import 'dart:io';

import 'package:barcode/barcode.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wob/controller/data_controller.dart';
import 'package:wob/types/user_data.dart';

getLocationTurnedOn() async {
  Location location = Location();
  bool serviceEnabled = await location.serviceEnabled();
  serviceEnabled = await location.requestService();
  if (!serviceEnabled) {
    getLocationTurnedOn();
  } else {
    return true;
  }
}

loadData() async {
  final prefs = await SharedPreferences.getInstance();
  String userModule = prefs.getString("userModule")!;
  final dc = Get.put(DataController());
  dc.setUserModule(UserModule.fromJson(jsonDecode(userModule)));
  dc.update();
}

void buildBarcode(
  Barcode bc,
  String data, {
  String? filename,
  double? width,
  double? height,
  double? fontHeight,
}) {
  final svg = bc.toSvg(
    data,
    width: width ?? 200,
    height: height ?? 80,
    fontHeight: fontHeight,
  );

  // Save the image
  filename ??= bc.name.replaceAll(RegExp(r'\s'), '-').toLowerCase();
  File('$filename.svg').writeAsStringSync(svg);
}
