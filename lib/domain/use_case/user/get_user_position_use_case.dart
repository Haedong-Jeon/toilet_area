
import 'package:toilet_area/domain/repository/user/user_data_repository.dart';

class GetUserPositionUseCase {
  final UserDataRepository userDataRepository;
  GetUserPositionUseCase(this.userDataRepository);

  Future call() async {
    await userDataRepository.getUserPosition();
  }
}