abstract class SettingRepository {
  Future saveSetting({String settingJson = ""});

  Future  loadDestMarkColor();
  Future loadNotDestMarkColor();
  Future loadSearchRange();
}
