import 'package:geolocator/geolocator.dart';

class LocationService {
  static Future<Position> determinePosition() async {
    // check whether the location service is enabled
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      throw Future.error('Location service is not enabled');
    }
    // check whether the user has given permission to access location data
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // if the user has not given permission, request permission
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Future.error('Location permission is not granted');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      throw Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }
    return await Geolocator.getCurrentPosition();
  }
}
