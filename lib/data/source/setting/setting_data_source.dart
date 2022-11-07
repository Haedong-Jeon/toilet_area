import 'package:shared_preferences/shared_preferences.dart';

class SettingDataSource {
  Future loadSetting() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      return pref.getString("setting");
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> isSettingExist() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.containsKey("setting");
  }

  Future saveSetting({String settingJson = ""}) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("setting", settingJson);
    } catch (e) {
      rethrow;
    }
  }
}
