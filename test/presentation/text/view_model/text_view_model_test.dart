
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:toilet_area/presentation/text/text_control.dart';
import 'package:toilet_area/presentation/text/view_model/text_view_model.dart';

void main() {
  test('텍스트 적용 테스트', ()async {
    WidgetsFlutterBinding.ensureInitialized();
    TextViewModel _textViewModel = TextViewModel(TextControl());
    await _textViewModel.setTexts();
    expect(_textViewModel.toiletListLoadFailText(),"화장실 목록을 불러오는데 실패했습니다.");
    expect(_textViewModel.toiletListLoadingText(), "화장실 목록을 불러오는 중입니다.");
  });
}