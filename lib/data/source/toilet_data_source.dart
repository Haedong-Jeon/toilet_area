import 'package:dio/dio.dart';
import 'package:toilet_area/data/source/keys.dart';

class ToiletDataSource {
 final String _dataEndpoint = "http://api.data.go.kr/openapi/tn_pubr_public_toilet_api";
 Future getToiletData() async {
  return await Dio().get(_dataEndpoint,options: Options(headers: {"Authorization":toiletApiKey}));
 }
}
