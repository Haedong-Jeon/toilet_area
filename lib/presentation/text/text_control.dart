// class TextControl {
//   static String toiletListLoadingText = "";
//   static String toiletListLoadFailText = "";
// }

import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_control.freezed.dart';
part 'text_control.g.dart';

@freezed
class TextControl with _$TextControl {
 factory TextControl({
   String? toiletListLoadFailText,
   String? toiletListLoadingText,
   String? findToiletInOneKilo,
}) =_TextControl;
  factory TextControl.fromJson(Map<String, dynamic> json) => _$TextControlFromJson(json);
}
