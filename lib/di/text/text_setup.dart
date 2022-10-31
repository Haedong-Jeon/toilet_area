import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toilet_area/presentation/text/text_control.dart';
import 'package:toilet_area/presentation/text/view_model/text_view_model.dart';

late final StateNotifierProvider<TextViewModel, TextControl>
    textViewModelProvider;

Future setUp() async {
  TextViewModel _textViewModel = TextViewModel(TextControl());
  await _textViewModel.setTexts();

  textViewModelProvider = StateNotifierProvider<TextViewModel, TextControl>(
      (ref) => _textViewModel);
}
