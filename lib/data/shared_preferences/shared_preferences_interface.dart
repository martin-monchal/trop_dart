abstract class SharedPreferencesService {
  Future<void> init();

  Map<String, String> login(String userName, String password);

  Future<void> register(String userName, String password);

  Future<void> setPicture(String path);

  Future<void> setName(String name);
}
