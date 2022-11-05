import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:toilet_area/domain/model/toilet/toilet.dart';
import 'package:toilet_area/domain/use_case/toilet/is_no_toilet_nearby_use_case.dart';

void main() {
  test("가까운 화장실 탐색 테스트", () {
    Toilet toilet = Toilet(longitude: "10", latitude: "10");
    IsNoToiletNearByUseCase usecase = IsNoToiletNearByUseCase();
    bool isNear = usecase(toilets: [toilet], userLat: 11, userLng: 11);
    expect(isNear, true);
  });
}
