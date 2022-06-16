// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String ISFIRST = "isFirst";

class IsFirstTime extends GetxService {
  int intValue = 0;

  Future<IsFirstTime> init() async {
    await getOnce();
    return this;
  }

  Future<void> getOnce() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getInt(ISFIRST) == null) {
      intValue = 0;
    } else {
      intValue = prefs.getInt(ISFIRST) ?? 0;
    }
  }

  Future setOnce(int num) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(ISFIRST, num);
  }
}
