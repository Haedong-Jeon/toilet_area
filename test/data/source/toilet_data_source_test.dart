import 'package:flutter_test/flutter_test.dart';
import 'package:toilet_area/data/repository/toilet_data_repository_impl.dart';
import 'package:toilet_area/data/source/toilet_data_source.dart';

void main() {
  test("화장실 목록 받아오기", () async {
    final response = await ToiletDataRepositoryImpl(ToiletDataSource()).getToiletData();
    expect(response.data["response"]["header"]["resultCode"], "0");
  });
}
