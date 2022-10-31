import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wob/controller/data_controller.dart';
import 'package:wob/main/mainscreen.dart';

class FindBeacons extends StatefulWidget {
  final Function setBeaconsDetected;
  const FindBeacons({Key? key, required this.setBeaconsDetected})
      : super(key: key);

  @override
  _FindBeaconsState createState() => _FindBeaconsState();
}

class _FindBeaconsState extends State<FindBeacons> with WidgetsBindingObserver {
  StreamSubscription<RangingResult>? _streamRanging;
  List<Beacon> beacons = [];
  final dc = Get.find<DataController>();
  int emptyRequests = 0;
  int emptyRequestsFromPrefs = 0;
  @override
  void initState() {
    super.initState();
    listeningState();
    setUpData();
  }

  @override
  void dispose() {
    _streamRanging?.cancel();
    super.dispose();
  }

  setUpData() async {
    final prefs = await SharedPreferences.getInstance();
    emptyRequestsFromPrefs = prefs.getInt('emptyReq') ?? 20;
    emptyRequests = emptyRequestsFromPrefs;
    setState(() {});
  }

  listeningState() async {
    try {
      var status = await Permission.location.request();
      if (status.isGranted) {
        await flutterBeacon.initializeAndCheckScanning;
        final regions = <Region>[];
        regions.add(Region(identifier: 'com.beacon'));
        await flutterBeacon.setScanPeriod(2000);
        flutterBeacon.ranging(regions).listen((result) {
          print(result);
          if (result.beacons.isNotEmpty) {
            for (Beacon beacon in result.beacons) {
              if (dc.storeDetails.any((element) =>
                  element.uuid == beacon.proximityUUID.toString())) {
                emptyRequests = emptyRequestsFromPrefs;
                beacons.clear();
                beacons.addAll(result.beacons);
                widget.setBeaconsDetected(beacons);
              }
            }
          } else {
            if (emptyRequests == 0) {
              beacons.clear();
              widget.setBeaconsDetected(beacons);
            } else {
              if (emptyRequests > 0) {
                emptyRequests--;
              }
            }
          }
          setState(() {});
        });
      } else if (status.isDenied) {
        listeningState();
      } else if (status.isPermanentlyDenied) {
        openAppSettings();
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }

  getTop(String? proximityUUID) {
    proximityUUID ??= "11F86432-187B-4DC3-802B-2A4838103DD2";
    int mac =
        int.parse(proximityUUID.substring(proximityUUID.length - 6), radix: 16);
    mac = (mac % 100) + 30;
    bool macBool = mac % 2 == 0;
    if (macBool) {
      return MediaQuery.of(context).size.height * 0.5 + mac;
    } else {
      return MediaQuery.of(context).size.height * 0.5 - mac;
    }
  }

  getLeft(String? proximityUUID) {
    proximityUUID ??= "11F86432-187B-4DC3-802B-2A4838103DD2";
    int mac =
        int.parse(proximityUUID.substring(proximityUUID.length - 6), radix: 16);
    mac = (mac % 100) + 30;
    bool macBool = mac % 2 == 0;
    if (macBool) {
      return MediaQuery.of(context).size.width * 0.5 + mac;
    } else {
      return MediaQuery.of(context).size.width * 0.5 - mac;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          for (var i = 0; i < beacons.length; i++)
            if (dc.storeDetails
                .any((element) => element.uuid == beacons[i].proximityUUID))
              Positioned(
                top: getTop(beacons[i].proximityUUID),
                left: getLeft(beacons[i].proximityUUID),
                child: GestureDetector(
                  onTap: () {
                    Get.offAll(
                      MainScreen(
                        storeDetails: dc.storeDetails.firstWhere((element) =>
                            element.uuid == beacons[i].proximityUUID),
                      ),
                      transition: Transition.rightToLeft,
                    );
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/icons/beacon-location.png',
                        width: 50,
                        height: 50,
                      ),
                      Text(
                        dc.storeDetails
                            .where((element) =>
                                element.uuid == beacons[i].proximityUUID)
                            .first
                            .name,
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        ],
      ),
    );
  }
}

class MyBeacon {
  final String proximityUUID;
  final String? macAddress;
  final int major;
  final int minor;
  final int rssi;

  const MyBeacon({
    required this.proximityUUID,
    this.macAddress,
    required this.major,
    required this.minor,
    required this.rssi,
  }) : super();
}
