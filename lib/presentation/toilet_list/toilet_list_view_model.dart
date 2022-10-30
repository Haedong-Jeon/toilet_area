import 'package:riverpod/riverpod.dart';
import 'package:toilet_area/domain/model/toilet/toilet.dart';
import 'package:toilet_area/domain/use_case/toilet/get_toilet_list_local_use_case.dart';
import 'package:toilet_area/domain/use_case/toilet/get_toilet_list_remote_use_case.dart';
import 'package:toilet_area/domain/use_case/toilet/save_toilet_list_use_case.dart';

class ToiletListViewModel extends StateNotifier<List<Toilet>>{
  final GetToiletListLocalUseCase getToiletListLocalUseCase;
  final GetToiletListFromRemoteUseCase getToiletListFromRemoteUseCase;

  final SaveToiletListUseCase saveToiletListUseCase;

  ToiletListViewModel(this.getToiletListLocalUseCase,
      this.getToiletListFromRemoteUseCase, this.saveToiletListUseCase) : super([]);
}
