import 'package:maps_toolkit/maps_toolkit.dart';
import 'package:toilet_area/domain/model/toilet/toilet.dart';

const KILO = 1000;

class IsNoToiletNearByUseCase {
  bool call({
    double userLat = 0,
    double userLng = 0,
    List<Toilet> toilets = const [],
  }) {
    int range = 1 * KILO;
    List<Toilet> nearToilets = [];
    for (Toilet toilet in toilets) {
      double? latitude = double.tryParse(toilet.latitude ?? "");
      double? longitude = double.tryParse(toilet.longitude ?? "");

      if (latitude == null || longitude == null) {
        continue;
      }
      if (_getDistance(userLat, userLng, latitude, longitude).abs() <= range) {
        nearToilets.add(toilet);
      }
    }
    if (nearToilets.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  double _getDistance(double lat1, double lng1, double lat2, double lng2) {
    var distanceBetweenPoints = SphericalUtil.computeDistanceBetween(
        LatLng(lat1, lng1), LatLng(lat2, lng2));
    return distanceBetweenPoints.toDouble();
  }
}
