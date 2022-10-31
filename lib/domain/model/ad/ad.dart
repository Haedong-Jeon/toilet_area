
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ad.freezed.dart';
part 'ad.g.dart';

@freezed
class Ad with _$Ad {
  factory Ad({
    required String bannerTestKey,
    required String nativeTestKey,
    required String compensationTestKey,
    required String foregroundTestKey,
  }) = _Ad;

  factory Ad.fromJson(Map<String, dynamic> json) => _$AdFromJson(json);
}
