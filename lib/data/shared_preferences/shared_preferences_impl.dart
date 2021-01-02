import 'package:shared_preferences/shared_preferences.dart';
import 'package:trop_dart/data/shared_preferences/shared_preferences_interface.dart';

class SharedPreferencesImpl extends SharedPreferencesService {
  SharedPreferencesImpl();
  SharedPreferences prefs;

  @override
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Map<String, String> login(String userName, String password) {
    if (prefs.getString(userName) == password) {
      final imagePath = prefs.getString('image') ?? '';
      final name = prefs.getString('name') ?? '';
      final map = {
        'image': imagePath,
        'name': name,
        'username': userName,
      };
      return map;
    }
    return null;
  }

  @override
  Future<void> register(String userName, String password) async {
    await prefs.setString(userName, password);
  }

  @override
  Future<void> setPicture(String path) async {
    await prefs.setString('image', path);
  }

  @override
  Future<void> setName(String path) async {
    await prefs.setString('name', path);
  }
}
