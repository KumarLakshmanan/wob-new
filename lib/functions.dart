import 'package:location/location.dart';

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
