import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:toilet_area/data/keys.dart';

class ToiletDataRemoteSource {
  final String _dataEndpoint =
      "http://api.data.go.kr/openapi/tn_pubr_public_toilet_api";

  String getKakaoMapKey() {
    return APIKey().kakaoMapKey;
  }

  String getGoogleKey() {
    return APIKey().googleMapKey;
  }

  Future<Response> getToiletListFromRemote(int page) async {
    try {
      final response = await Dio().get(_dataEndpoint, queryParameters: {
        "serviceKey": APIKey().toiletApiKey,
        "type": "json",
        "numOfRows": 100,
        "pageNo": page,
      });
      log(jsonEncode(response.data));
      if (response.data["response"]["header"]["resultCode"] != "00") {
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
