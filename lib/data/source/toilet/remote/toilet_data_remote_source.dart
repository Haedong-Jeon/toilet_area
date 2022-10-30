import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:toilet_area/data/source/toilet/remote/keys.dart';

class ToiletDataRemoteSource {
  final String _dataEndpoint =
      "http://api.data.go.kr/openapi/tn_pubr_public_toilet_api";

  Future<Response> getToiletListFromRemote(int page) async {
    try {
      final response = await Dio().get(_dataEndpoint, queryParameters: {
        "serviceKey": APIKey().toiletApiKey,
        "type": "json",
        "numOfRows": 100,
        "pageNo": page,
      });
      if (response.data["response"]["header"]["resultCode"] != "0") {
        throw DioError(
            requestOptions: RequestOptions(path: _dataEndpoint),
            type: DioErrorType.response,
            error: {
              "result code is ${response.data["response"]["header"]["resultCode"]}"
            });
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
