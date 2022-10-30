
import 'package:geolocator/geolocator.dart';

abstract class UserDataRepository {
  Future getUserPosition();
  Stream<Position> getPositionStream();
}