import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:toilet_area/data/repository/user/user_data_repository_impl.dart';
import 'package:toilet_area/data/source/user/geolocator.dart';
import 'package:toilet_area/domain/model/user/user.dart';
import 'package:toilet_area/domain/repository/user/user_data_repository.dart';
import 'package:toilet_area/domain/use_case/user/check_is_dest_near_use_case.dart';
import 'package:toilet_area/domain/use_case/user/get_position_stream_use_case.dart';
import 'package:toilet_area/domain/use_case/user/get_user_position_use_case.dart';
import 'package:toilet_area/presentation/user/view_model/user_view_model.dart';

late final StateNotifierProvider<UserViewModel, User> userViewModelProvider;

Future setUp() async {
  GeoLocator geoLocator = GeoLocator();
  await geoLocator.getPermission();
  UserDataRepository userDataRepository = UserDataRepositoryImpl(geoLocator);

  GetUserPositionUseCase getUserPositionUseCase =
      GetUserPositionUseCase(userDataRepository);
  GetPositionStreamUseCase getPositionStreamUseCase =
      GetPositionStreamUseCase(userDataRepository);
  CheckIsDestNearUseCase checkIsDestNearUseCase = CheckIsDestNearUseCase();

  Position? pos = await getUserPositionUseCase();

  UserViewModel _userViewModel = UserViewModel(
      getUserPositionUseCase, getPositionStreamUseCase, checkIsDestNearUseCase);
  _userViewModel.saveUserPosition(
      latitude: pos?.latitude ?? 140, longitude: pos?.longitude ?? 140);

  userViewModelProvider =
      StateNotifierProvider<UserViewModel, User>((ref) => _userViewModel);
}
