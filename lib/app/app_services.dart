import 'package:get_it/get_it.dart';
import 'package:trop_dart/data/beer/beer_interface.dart';
import 'package:trop_dart/data/shared_preferences/shared_preferences_interface.dart';
import 'package:trop_dart/data/storage/storage.dart';

abstract class ApplicationServicesProvider {
  SharedPreferencesService get sharedPreferences;

  Storage get storage;

  BeerService get beer;
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
      })
      ..registerSingletonAsync<Storage>(() async {
        Storage storage = provider.storage;
        await storage.init();
        return storage;
      })
      ..registerSingletonAsync<BeerService>(() async {
        BeerService beer = provider.beer;
        await beer.init();
        return beer;
      }, dependsOn: <Type>[Storage]);

    return GetIt.instance.allReady();
  }

  static SharedPreferencesService get sharedPreferences =>
      GetIt.instance.get<SharedPreferencesService>();

  static Storage get storage => GetIt.instance.get<Storage>();

  static BeerService get beer => GetIt.instance.get<BeerService>();
}
