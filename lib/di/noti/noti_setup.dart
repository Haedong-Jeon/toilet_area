import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toilet_area/data/repository/noti/local/noti_local_repository_impl.dart';
import 'package:toilet_area/data/source/noti/local/local_noti_source.dart';
import 'package:toilet_area/domain/model/noti/noti.dart';
import 'package:toilet_area/domain/repository/noti/local/noti_local_repository.dart';
import 'package:toilet_area/presentation/noti/view_model/noti_view_model.dart';

late final StateNotifierProvider<NotiViewModel, Noti> notiViewModelProvider;

Future setUp() async {
  NotiLocalDatSource dataSource = NotiLocalDatSource();
  NotiLocalRepository repository = NotiLocalRepositoryImpl(dataSource);
  NotiViewModel notiViewModel = NotiViewModel(Noti(), repository);
  notiViewModel.repository.initializeLocalNoti(
    (id, title, body, payload) async => print("noti taped"),
    // (response) => (){},
    (reponse) async => print("noti taped...!!"),
  );
  notiViewModelProvider =
      StateNotifierProvider<NotiViewModel, Noti>((ref) => notiViewModel);
}
