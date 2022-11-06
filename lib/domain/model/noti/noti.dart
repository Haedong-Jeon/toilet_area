import 'package:freezed_annotation/freezed_annotation.dart';

part 'noti.freezed.dart';
part 'noti.g.dart';

@freezed
class Noti with _$Noti {
  factory Noti({
    String? title,
    String? body,
    String? payload,
  }) = _Noti;

  factory Noti.fromJson(Map<String, dynamic> json) => _$NotiFromJson(json);
}
