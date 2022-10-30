import 'package:dio/dio.dart';
import 'package:toilet_area/data/source/toilet/remote/keys.dart';

class ToiletDataRemoteSource {
  final String _dataEndpoint =
      "http://api.data.go.kr/openapi/tn_pubr_public_toilet_api";

  Future<Response> getToiletListFromRemote(int page) async {
    final response = await Dio().get(_dataEndpoint, queryParameters: {
      "serviceKey": APIKey().toiletApiKey,
      "type": "json",
      "numOfRows":100,
      "pageNo":page,
    });
    return response;
  }
}
