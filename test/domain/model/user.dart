import 'package:flutter_test/flutter_test.dart';
import 'package:toilet_area/domain/model/user/user.dart';

void main() {
  test("유저 생성", () {
    User user = User.fromJson({
      "latitude": 3.0,
      "longitude": 2.5,
      "lastAppOpenedAt": DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      ).toString(),
    });
    expect(user.longitude, 2.5);
    expect(user.latitude, 3.0);
    expect(user.lastAppOpenedAt,  DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    ).toString());
  });
}
