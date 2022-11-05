import 'package:maps_toolkit/maps_toolkit.dart';
import 'package:toilet_area/domain/model/toilet/toilet.dart';

class GetNearestToiletPosUseCase {
  GetNearestToiletPosUseCase();

  LatLng call({
    double userLat = 0,
    double userLng = 0,
    List<Toilet> toilets = const [],
  }) {
    double distance = 1000000000000;
    LatLng result = LatLng(0, 0);
    for (Toilet toilet in toilets) {
      double? latitude = double.tryParse(toilet.latitude ?? "");
      double? longitude = double.tryParse(toilet.longitude ?? "");

      if (latitude == null || longitude == null) {
        continue;
      }

      double temp = _getDistance(userLat, userLng, latitude, longitude).abs();
      if (temp < distance) {
        distance = temp;
        result = LatLng(latitude, longitude);
      }
    }
    return result;
  }

  double _getDistance(double lat1, double lng1, double lat2, double lng2) {
    var distanceBetweenPoints = SphericalUtil.computeDistanceBetween(
        LatLng(lat1, lng1), LatLng(lat2, lng2));
    return distanceBetweenPoints.toDouble();
  }
}
