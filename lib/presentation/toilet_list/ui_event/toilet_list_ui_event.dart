import 'package:freezed_annotation/freezed_annotation.dart';
part 'toilet_list_ui_event.freezed.dart';


@freezed
abstract class ToiletListUiEvent with _$ToiletListUiEvent {
  const factory ToiletListUiEvent.onLoading() = OnLoading;
  const factory ToiletListUiEvent.onError(String message) = OnError;
  const factory ToiletListUiEvent.onSuccess() = OnSuccess;
}