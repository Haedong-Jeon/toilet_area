import 'package:geolocator/geolocator.dart';
import 'package:toilet_area/data/source/user/geolocator.dart';
import 'package:toilet_area/domain/repository/user/user_data_repository.dart';

class UserDataRepositoryImpl extends UserDataRepository {
  final GeoLocator geolocator;

  UserDataRepositoryImpl(this.geolocator);
  @override
  Future<Position?> getUserPosition() async {
    return await geolocator.getUserPosition();
  }

  @override
  Stream<Position> getPositionStream() {
    return geolocator.getPositionStream();
  }

}
