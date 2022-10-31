import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:clippy_flutter/triangle.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wob/controller/data_controller.dart';
import 'package:wob/detect/detect.dart';
import 'package:wob/types/store_details.dart';
import 'package:wob/widgets/button.dart';
import 'package:wob/widgets/custom_info_widget.dart';

import '../constants.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  bool isPostionUpdated = false;
  late GoogleMapController mapController;
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  ScrollController scrollController = ScrollController();
  final dc = Get.find<DataController>();
  StoreDetails? currentStore;
  Set<Marker> markers = {};
  late BitmapDescriptor locationicon;
  late BitmapDescriptor mylocationicon;
  LatLng? initialcameraposition;
  final Location _location = Location();
  bool isIconsUpdated = false;
  late StreamSubscription<LocationData> locationSubscription;

  @override
  void initState() {
    super.initState();
    onInitFunc();
  }

  Future<Uint8List> getBytesFromAsset(String path) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    ui.FrameInfo fi = await codec.getNextFrame();
    var bufferList =
        (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
            .buffer
            .asUint8List();
    return bufferList;
  }

  onInitFunc() async {
    locationicon = BitmapDescriptor.fromBytes(
        await getBytesFromAsset('assets/icons/location-pin.png'));
    mylocationicon = BitmapDescriptor.fromBytes(
        await getBytesFromAsset('assets/icons/location.png'));
    setState(() {
      isIconsUpdated = true;
    });
  }

  void onMapcreated(GoogleMapController controller) async {
    mapController = controller;
    controller.setMapStyle(
      Get.isDarkMode ? json.encode(darkMapStyle) : json.encode(lightMapStyle),
    );
    _customInfoWindowController.googleMapController = controller;
    locationSubscription = _location.onLocationChanged.listen((location) async {
      if (location.runtimeType == Null) {
        return;
      }
      if (kDebugMode) {
        print(location);
      }
      initialcameraposition = LatLng(location.latitude!, location.longitude!);
      if (isPostionUpdated == false) {
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(location.latitude!, location.longitude!),
              zoom: 15,
            ),
          ),
        );
        isPostionUpdated = true;
      }
      markers.clear();
      await setMarkersOnMap();
    });
    await setMarkersOnMap();
  }

  setMarkersOnMap() async {
    if (isIconsUpdated == false) {
      await onInitFunc();
    }
    for (int i = 0; i < dc.storeDetails.length; i++) {
      markers.add(
        Marker(
          markerId: MarkerId(dc.storeDetails[i].id),
          position: LatLng(
              double.parse(dc.storeDetails[i].latlng.split(",")[0]),
              double.parse(dc.storeDetails[i].latlng.split(",")[1])),
          icon: locationicon,
          onTap: () {
            currentStore = dc.storeDetails[i];
            scrollController.animateTo(
              ((MediaQuery.of(context).size.width * 0.7) * (i)) + 30,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
            _customInfoWindowController.addInfoWindow(
              Column(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.offAll(
                          const Detect(),
                          transition: Transition.rightToLeft,
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        width: double.infinity,
                        child: Text(
                          dc.storeDetails[i].name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ),
                  Triangle.isosceles(
                    edge: Edge.BOTTOM,
                    child: Container(
                      color: Colors.blue,
                      width: 20.0,
                      height: 10.0,
                    ),
                  ),
                ],
              ),
              LatLng(
                double.parse(dc.storeDetails[i].latlng.split(",")[0]),
                double.parse(dc.storeDetails[i].latlng.split(",")[1]),
              ),
            );
            setState(() {});
          },
        ),
      );
    }
    if (initialcameraposition.runtimeType != Null) {
      markers.add(
        Marker(
          markerId: const MarkerId('myPosition'),
          position: initialcameraposition!,
          icon: mylocationicon,
        ),
      );
    }
    setState(() {});
  }

  @override
  void dispose() {
    mapController.dispose();
    locationSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: initialcameraposition ?? const LatLng(0, 0),
                zoom: 5,
              ),
              onTap: (position) {
                _customInfoWindowController.hideInfoWindow();
                setState(() {
                  currentStore = null;
                });
              },
              onCameraMove: (position) {
                _customInfoWindowController.onCameraMove();
              },
              mapType: MapType.normal,
              markers: markers,
              onMapCreated: onMapcreated,
              compassEnabled: true,
              zoomControlsEnabled: false,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
            ),
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 40,
            offset: 40,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: FloatingActionButton(
                    mini: true,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.location_searching,
                      color: Colors.grey.shade700,
                    ),
                    onPressed: () {
                      if (initialcameraposition.runtimeType != Null) {
                        mapController.animateCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target:
                                  initialcameraposition ?? const LatLng(0, 0),
                              zoom: 15,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 200,
                  child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    controller: scrollController,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      if (dc.storeDetails.isNotEmpty)
                        for (int i = 0; i < dc.storeDetails.length; i++)
                          Container(
                            height: 300,
                            margin: const EdgeInsets.only(
                              left: 5,
                              right: 5,
                            ),
                            width: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(
                              color: Get.isDarkMode
                                  ? design.dark.background2
                                  : design.light.background2,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        currentStore = dc.storeDetails[i];
                                      });
                                      _customInfoWindowController
                                          .hideInfoWindow();
                                      _customInfoWindowController.addInfoWindow(
                                        Column(
                                          children: [
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  Get.offAll(
                                                    const Detect(),
                                                    transition:
                                                        Transition.rightToLeft,
                                                  );
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: Colors.blue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                  ),
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8),
                                                  width: double.infinity,
                                                  child: Text(
                                                    dc.storeDetails[i].name,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                    ),
                                                    maxLines: 1,
                                                    overflow: TextOverflow.fade,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Triangle.isosceles(
                                              edge: Edge.BOTTOM,
                                              child: Container(
                                                color: Colors.blue,
                                                width: 20.0,
                                                height: 10.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        LatLng(
                                          double.parse(dc.storeDetails[i].latlng
                                              .split(",")[0]),
                                          double.parse(dc.storeDetails[i].latlng
                                              .split(",")[1]),
                                        ),
                                      );
                                      scrollController.animateTo(
                                        ((MediaQuery.of(context).size.width *
                                                    0.7) *
                                                (i)) +
                                            30,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeInOut,
                                      );
                                      mapController.animateCamera(
                                        CameraUpdate.newCameraPosition(
                                          CameraPosition(
                                            target: LatLng(
                                              double.parse(
                                                dc.storeDetails[i].latlng
                                                    .split(",")[0],
                                              ),
                                              double.parse(
                                                dc.storeDetails[i].latlng
                                                    .split(",")[1],
                                              ),
                                            ),
                                            zoom: 15,
                                          ),
                                        ),
                                      );
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      clipBehavior: Clip.hardEdge,
                                      child:
                                          Image.asset("assets/images/shop.png"),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            dc.storeDetails[i].name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5,
                                          ),
                                          Text(
                                            dc.storeDetails[i].address,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2!
                                                .copyWith(
                                                  color:
                                                      const Color(0xFFEF5DA8),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        launch(
                                            "https://www.google.com/maps/search/?api=1&query=${dc.storeDetails[i].latlng.split(",")[0]},${dc.storeDetails[i].latlng.split(",")[1]}");
                                      },
                                      child: Image.asset(
                                        "assets/icons/way.png",
                                        width: 25,
                                        height: 25,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Get.isDarkMode
                        ? design.dark.background2
                        : design.light.background2,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (currentStore != null)
                        MaterialBtn(
                          onPressed: () {
                            Get.offAll(
                              const Detect(),
                              transition: Transition.rightToLeft,
                            );
                          },
                          text: "Check In",
                          color: Get.isDarkMode
                              ? design.dark.secondary
                              : design.light.secondary,
                          margin: const EdgeInsets.only(),
                          isPrimary: true,
                          height: 50,
                        )
                      else
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Found ${dc.storeDetails.length} Stores nearby your location",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      color: Get.isDarkMode
                                          ? design.dark.textcolor
                                          : design.light.textcolor,
                                    ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            MaterialButton(
                              color: Get.isDarkMode
                                  ? design.dark.secondary
                                  : design.light.secondary,
                              child: Text(
                                "Show all",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                              onPressed: () {
                                if (initialcameraposition.runtimeType != Null) {
                                  mapController.animateCamera(
                                    CameraUpdate.newCameraPosition(
                                      CameraPosition(
                                        target: initialcameraposition!,
                                        zoom: 6,
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
