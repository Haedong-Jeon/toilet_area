import 'package:maps_toolkit/maps_toolkit.dart';

class CheckIsDestNearUseCase {
  bool call({double curLat = 0, double curLng = 0, double destLat = 0, double destLng = 0}) {
    if(_getDistance(curLat, curLng, destLat, destLng).abs() < 250) {
      //250m 이내라면 근처에 있다고 판단한다.
      return true;
    }
    return false;
  }

  double _getDistance(double lat1, double lng1, double lat2, double lng2) {
    var distanceBetweenPoints = SphericalUtil.computeDistanceBetween(
        LatLng(lat1, lng1), LatLng(lat2, lng2));
    return distanceBetweenPoints.toDouble();
  }
}