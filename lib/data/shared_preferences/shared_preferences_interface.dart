abstract class SharedPreferencesService {
  Future<void> init();

  bool login(String userName, String password);

  Future<void> register(String userName, String password);
}
