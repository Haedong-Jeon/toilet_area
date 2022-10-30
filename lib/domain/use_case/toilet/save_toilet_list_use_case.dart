import 'package:toilet_area/domain/model/toilet/toilet.dart';
import 'package:toilet_area/domain/repository/toilet/toilet_data_repository.dart';

class SaveToiletListUseCase {
  final ToiletDataRepository repository;
  SaveToiletListUseCase(this.repository);
  Future call(List<Toilet> toilets)async {
    return await repository.saveToiletList(toilets);
  }
}