import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import 'package:toilet_area/domain/model/toilet/toilet.dart';
import 'package:toilet_area/domain/use_case/toilet/get_toilet_list_local_use_case.dart';
import 'package:toilet_area/domain/use_case/toilet/get_toilet_list_remote_use_case.dart';
import 'package:toilet_area/domain/use_case/toilet/save_toilet_list_use_case.dart';

class ToiletListViewModel extends StateNotifier<List<Toilet>> {
  final GetToiletListLocalUseCase getToiletListLocalUseCase;
  final GetToiletListFromRemoteUseCase getToiletListFromRemoteUseCase;

  final SaveToiletListUseCase saveToiletListUseCase;

  ToiletListViewModel(this.getToiletListLocalUseCase,
      this.getToiletListFromRemoteUseCase, this.saveToiletListUseCase)
      : super([]);

  int toiletListPage = 0;

  ///원격으로 화장실 목록을 불러오는 함수. 공공 API 응답에 따라 리팩토링 필요
  Future<List<Toilet>> getToiletListFromRemote() async {
    Response response = await getToiletListFromRemoteUseCase(toiletListPage);
    state = response.data["data"]["toilet_list"];
    saveToiletList(state);
    return state;
  }
  Future<List<Toilet>> loadMoreToiletFromRemote() async {
    toiletListPage +=1;
    return await getToiletListFromRemote();
  }

  Future<List<Toilet>> getToiletListLocal() async {
    List<Toilet> toilets = await getToiletListLocalUseCase();
    state = toilets;
    return state;
  }

  Future saveToiletList(List<Toilet> toilets) async {
    await saveToiletListUseCase(toilets);
  }
}
