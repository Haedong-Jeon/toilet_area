import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toilet_area/domain/model/noti/noti.dart';
import 'package:toilet_area/domain/repository/noti/local/noti_local_repository.dart';

class NotiViewModel extends StateNotifier<Noti> {
  final NotiLocalRepository repository;
  NotiViewModel(super.state, this.repository);

  Future showNoti(int id) async {
    await repository.showNoti(
        id: id, title: state.title ?? "", body: state.body ?? "");
  }

  void setNoti(String title, String body) {
    state = state.copyWith(title: title, body: body);
  }
}
