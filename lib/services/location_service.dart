import 'package:geolocator/geolocator.dart';

class LocationService {
  // 기본값 : 서울 위도 경도
  double latitude = 37.566535;
  double longitude = 126.9779692;

  getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
    } else {
      Position position = await Geolocator.getCurrentPosition();
      latitude = position.latitude;
      longitude = position.longitude;
    }
  }
}
