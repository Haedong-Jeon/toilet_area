import 'package:flutter_test/flutter_test.dart';
import 'package:toilet_area/data/repository/toilet/toilet_data_repository_impl.dart';
import 'package:toilet_area/data/source/toilet/remote/toilet_data_remote_source.dart';
import 'package:toilet_area/domain/use_case/toilet/get_toilet_list_use_case.dart';

void main() {
  test("화장실 목록 받아오기", () async {
    GetToiletListFromRemoteUseCase getToiletListFromRemoteUseCase = GetToiletListFromRemoteUseCase(ToiletDataRepositoryImpl(ToiletDataRemoteSource()));
    final response = await getToiletListFromRemoteUseCase();
    expect(response.data["response"]["header"]["resultCode"], "0");
  });
}
