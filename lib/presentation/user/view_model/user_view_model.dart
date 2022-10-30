
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toilet_area/domain/model/user/user.dart';
import 'package:geolocator/geolocator.dart';
import 'package:toilet_area/domain/use_case/user/get_position_stream_use_case.dart';
import 'package:toilet_area/domain/use_case/user/get_user_position_use_case.dart';

class UserViewModel extends StateNotifier<User> {
  UserViewModel(this.getUserPositionUseCase, this.getPositionStreamUseCase):super(User());
  GetUserPositionUseCase getUserPositionUseCase;
  GetPositionStreamUseCase getPositionStreamUseCase;

  Future getUserPosition() async {
    return await getUserPositionUseCase();
  }
  Stream<Position> getPositionStream() {
    return getPositionStreamUseCase();
  }
}