import 'package:geolocator/geolocator.dart';
import 'package:toilet_area/domain/repository/user/user_data_repository.dart';

class GetPositionStreamUseCase {
final  UserDataRepository userDataRepository;

  GetPositionStreamUseCase(this.userDataRepository);

  Stream<Position> call() {
    return userDataRepository.getPositionStream();
  }
}