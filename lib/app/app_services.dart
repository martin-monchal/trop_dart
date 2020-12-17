import 'package:get_it/get_it.dart';
import 'package:trop_dart/data/shared_preferences/shared_preferences_interface.dart';

abstract class ApplicationServicesProvider {
  SharedPreferencesService get sharedPreferences;
}

class ApplicationServices {
  const ApplicationServices._();

  static Future<void> register(ApplicationServicesProvider provider) {
    assert(provider != null);

    GetIt.instance
      ..registerSingletonAsync<SharedPreferencesService>(() async {
        SharedPreferencesService sharedPreferences = provider.sharedPreferences;
        await sharedPreferences.init();
        return sharedPreferences;
      });

    return GetIt.instance.allReady();
  }

  static SharedPreferencesService get sharedPreferences =>
      GetIt.instance.get<SharedPreferencesService>();
}
