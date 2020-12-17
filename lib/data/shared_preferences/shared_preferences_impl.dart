import 'package:shared_preferences/shared_preferences.dart';
import 'package:trop_dart/data/shared_preferences/shared_preferences_interface.dart';

class SharedPreferencesImpl extends SharedPreferencesService {
  SharedPreferences prefs;

  SharedPreferencesImpl();

  @override
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  bool login(String userName, String password) {
    if (prefs.getString(userName) == password) {
      return true;
    }
    return false;
  }

  @override
  Future<void> register(String userName, String password) async {
    await prefs.setString(userName, password);
  }
}
