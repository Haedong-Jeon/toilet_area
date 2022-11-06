import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:toilet_area/data/repository/toilet/toilet_data_repository_impl.dart';
import 'package:toilet_area/data/source/toilet/local/toilet_data_local_source.dart';
import 'package:toilet_area/domain/model/toilet/toilet.dart';
import 'package:toilet_area/domain/use_case/toilet/get_toilet_list_local_use_case.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  test('로컬 데이터 테스트', () async {

    ToiletDataLocalSource localDataSource = ToiletDataLocalSource();
    List<Toilet> response = await GetToiletListLocalUseCase(
        ToiletDataRepositoryImpl(null,  localDataSource))();
    expect(response.isNotEmpty, true);
  });
}
