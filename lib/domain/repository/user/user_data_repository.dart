
import 'package:geolocator/geolocator.dart';

abstract class UserDataRepository {
  Future<Position?> getUserPosition();
  Stream<Position> getPositionStream();
}