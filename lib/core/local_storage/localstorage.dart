import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  late SharedPreferences prefs;
  static final LocalStorage _instance = LocalStorage._internal();

  factory LocalStorage() {
    return _instance;
  }

  LocalStorage._internal();

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  //save dataobj
  Future<void> saveDataObj(String key, String value) async {
    await prefs.setString(key, value);
  }

  //get dataobj
  String? getDataObj(String key) {
    return prefs.getString(key);
  }
}
