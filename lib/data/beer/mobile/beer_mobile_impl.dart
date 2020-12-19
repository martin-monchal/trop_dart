import 'package:get_it/get_it.dart';
import 'package:trop_dart/app/app_services.dart';
import 'package:trop_dart/data/beer/beer_interface.dart';
import 'package:trop_dart/data/storage/hive/model/hive_beer.dart';
import 'package:trop_dart/data/storage/hive/storage_hive.dart';
import 'package:trop_dart/data/storage/storage.dart';
import 'package:trop_dart/ui/screens/shared/model/beer.dart';

class BeerMobileImpl extends BeerService {
  StorageBox _box;

  @override
  Future<void> init() async {
    await _initStorage();
  }

  Future<void> _initStorage() async {
    _box = await ApplicationServices.storage.create('beer');
  }

  @override
  Future<void> generateBeer(int id, Beer data) async {
    await _saveBeer(id, data);
  }

  Future<void> _saveBeer(int id, Beer data) async {
    HiveBeer beer = HiveBeer.fromBeer(data, id);
    await _box.saveItem('beer', beer);
  }

  @override
  Future<StoredBeer> getStoredBeer() async {
    HiveBeer beer = await _box.getItem('beer', HiveBeer());

    return beer.toStoredBeer();
  }

  @override
  Future<BeerService> get beerServices async {
    BeerService beerService;
    try {
      beerService = ApplicationServices.beer;
    } catch (err) {
      // Not initialized, let's do it manually
      beerService = BeerMobileImpl();
      GetIt.instance.registerSingleton<BeerService>(beerService);
      GetIt.instance.registerSingleton<Storage>(StorageWithHive());
      await beerService.init();
    }

    return beerService;
  }
}
