import 'package:maps_toolkit/maps_toolkit.dart';
import 'package:toilet_area/domain/model/toilet/toilet.dart';

const int KILO = 1000;

class GetNearToiletsUseCase {
  GetNearToiletsUseCase();

  List<Toilet> call({
    double userLat = 0,
    double userLng = 0,

    ///range는 미터 단위
    double range = 3,
    List<Toilet> toilets = const [],
  }) {
    List<Toilet> results = [];
    for (Toilet toilet in toilets) {
      double? latitude = double.tryParse(toilet.latitude ?? "");
      double? longitude = double.tryParse(toilet.longitude ?? "");

      if (latitude == null || longitude == null) {
        continue;
      }
      if (_getDistance(latitude, longitude, userLat, userLng).abs() <=
          range * KILO) {
        results.add(toilet);
      }
    }
    return results;
  }

  double _getDistance(double lat1, double lng1, double lat2, double lng2) {
    var distanceBetweenPoints = SphericalUtil.computeDistanceBetween(
        LatLng(lat1, lng1), LatLng(lat2, lng2));
    return distanceBetweenPoints.toDouble();
  }
}
