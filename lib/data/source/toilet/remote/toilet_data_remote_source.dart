import 'package:dio/dio.dart';
import 'package:toilet_area/data/source/toilet/remote/keys.dart';

class ToiletDataRemoteSource {
  final String _dataEndpoint =
      "http://api.data.go.kr/openapi/tn_pubr_public_toilet_api";

  Future<Response> getToiletListFromRemote() async {
    final response = await Dio().get(_dataEndpoint, queryParameters: {
      "serviceKey": APIKey().toiletApiKey,
      "type": "json",
    });
    return response;
  }
}
