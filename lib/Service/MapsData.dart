import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

String finalAddress = "Searching Address";

class GenerateMaps extends ChangeNotifier {
  late Position position;

  Future getCurrentLocation() async {
    // final cords =
    //     geoCo.Coordinates(positionData.latitude, positionData.longitude);
    // var address =
    //     await geoCo.Geocoder.local.findAddressesFromCoordinates(cords);
    // finalAddress = address.first.adminArea;
    // print(finalAddress);

    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    var positionData = await GeolocatorPlatform.instance.getCurrentPosition();

    var address = await placemarkFromCoordinates(
        positionData.latitude, positionData.longitude);

    finalAddress = address.first.subLocality.toString();
    notifyListeners();
  }
}
