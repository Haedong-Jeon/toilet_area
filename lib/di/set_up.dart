import 'package:toilet_area/di/ad/ad_setup.dart' as ad_setup;
import 'package:toilet_area/di/text/text_setup.dart' as text_setup;
import 'package:toilet_area/di/toilet/toilet_setup.dart' as toilet_setup;
import 'package:toilet_area/di/user/user_setup.dart' as user_setup;
import 'package:toilet_area/di/map/map_setup.dart' as map_setup;
import 'package:toilet_area/di/noti/noti_setup.dart' as noti_setup;
import 'package:toilet_area/di/setting/setting_setup.dart' as setting_setup;

Future setUpProviders() async {
  await ad_setup.setUp();
  await toilet_setup.setUp();
  await user_setup.setUp();
  await text_setup.setUp();
  await map_setup.setUp();
  await noti_setup.setUp();
  await setting_setup.setUp();
}
