
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:toilet_area/domain/model/user/user.dart';
import 'package:toilet_area/domain/use_case/user/check_is_dest_near_use_case.dart';
import 'package:toilet_area/domain/use_case/user/check_is_dest_near_use_case.dart';
import 'package:toilet_area/domain/use_case/user/check_is_dest_near_use_case.dart';
import 'package:toilet_area/domain/use_case/user/get_position_stream_use_case.dart';
import 'package:toilet_area/domain/use_case/user/get_user_position_use_case.dart';

class UserViewModel extends StateNotifier<User> {
  UserViewModel(this.getUserPositionUseCase, this.getPositionStreamUseCase,this.checkIsDestNearUseCase):super(User());
  GetUserPositionUseCase getUserPositionUseCase;
  GetPositionStreamUseCase getPositionStreamUseCase;
  CheckIsDestNearUseCase checkIsDestNearUseCase;


  double getUserLongitude() {
    return state.longitude??144;
  }
  double getUserLatitude() {
    return state.latitude??144;
  }
  Stream<Position> getPositionStream() {
    return getPositionStreamUseCase();
  }
  void saveUserPosition({double? latitude, double? longitude}) {
    state = state.copyWith(longitude: longitude, latitude: latitude);
  }
  void setDestination({double destLat = 0, double destLng = 0, String name=""}) {
    state = state.copyWith(destLng: destLng, destLat: destLat, desetName: name);
  }
  bool checkIsDestNear({double curLat = 0, double curLng = 0}) {
    return checkIsDestNearUseCase(curLat: curLat, curLng: curLng, destLat: state.destLat ?? 0, destLng: state.destLng ?? 0);
  }
  String getDestName() {
    return state.desetName ?? "";
  }
}