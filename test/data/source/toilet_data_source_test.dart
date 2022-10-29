import 'package:flutter_test/flutter_test.dart';
import 'package:toilet_area/data/repository/toilet_data_repository_impl.dart';
import 'package:toilet_area/data/source/toilet_data_source.dart';
import 'package:toilet_area/domain/use_case/get_toilet_list_use_case.dart';

void main() {
  GetToiletListUseCase getToiletListUseCase = GetToiletListUseCase(ToiletDataRepositoryImpl(ToiletDataSource()));
  test("화장실 목록 받아오기", () async {
    final response = await getToiletListUseCase();
    expect(response.data["response"]["header"]["resultCode"], "0");
  });
}
