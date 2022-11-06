import 'package:dio/dio.dart';
import 'package:toilet_area/data/source/toilet/local/toilet_data_local_source.dart';
import 'package:toilet_area/data/source/toilet/remote/toilet_data_remote_source.dart';
import 'package:toilet_area/domain/model/toilet/toilet.dart';
import 'package:toilet_area/domain/repository/toilet/toilet_data_repository.dart';

class ToiletDataRepositoryImpl extends ToiletDataRepository {
  ToiletDataRemoteSource? remoteDataSource;
  ToiletDataLocalSource? localDataSource;

  ToiletDataRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<List<Toilet>> getToiletListFromRemote(int page,
      {double userLat = 0, double userLng = 0}) async {
    List<Toilet> toilets = [];
    if (remoteDataSource == null) {
      throw Error();
    }
    try {
      final response = await remoteDataSource!
          .getToiletListFromRemote(page, userLat: userLat, userLng: userLng);
      response.data["response"]["body"]["items"].forEach((e) {
        try {
          Toilet toilet = Toilet.fromJson(e);
          toilets.add(toilet);
        } catch (e) {
          throw DioError(
              requestOptions: RequestOptions(
                path: "myapp",
              ),
              type: DioErrorType.response,
              error: {"toilet instantiate fail"});
        }
      });
      return toilets;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future getToiletListFromLocal() async {
    if (localDataSource == null) {
      return;
    }
    try {
      List<Toilet> toilets = await localDataSource!.getToiletListFromLocal();
      return toilets;
    } catch (e) {
      rethrow;
    }
  }

  @override
  String getKakaoMapKey() {
    return remoteDataSource!.getKakaoMapKey();
  }
}
