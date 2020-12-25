import 'package:get_it/get_it.dart';
import 'package:trop_dart/app/app_services.dart';
import 'package:trop_dart/data/beer/beer_interface.dart';
import 'package:trop_dart/data/storage/hive/model/hive_beer.dart';
import 'package:trop_dart/data/storage/hive/storage_hive.dart';
import 'package:trop_dart/data/storage/storage.dart';
import 'package:trop_dart/ui/screens/shared/model/beer.dart';

class BeerMobileImpl extends BeerService {
  StorageBox _box;
  bool isInitialized = false;

  @override
  Future<void> init() async {
    isInitialized = false;
    await _initStorage();
    isInitialized = true;
  }

  Future<void> _initStorage() async {
    _box = await ApplicationServices.storage.create('beer');
  }

  @override
  Future<void> generateBeer(int id, Beer data) async {
    if (!isInitialized) {
      await init();
    }
    await _saveBeer(id, data);
  }

  Future<void> _saveBeer(int id, Beer data) async {
    List<HiveBeer> beers = (await _box.getList('beer', <HiveBeer>[])).cast();

    beers.add(HiveBeer.fromBeer(data, id));
    await _box.saveList('beer', beers);
  }

  @override
  Future<Iterable<StoredBeer>> getStoredBeers() async {
    List<HiveBeer> beers = (await _box.getList('beer', <HiveBeer>[])).cast();

    /*  history.sort((HiveNotification a, HiveNotification b) =>
        b.publicationDate.compareTo(a.publicationDate)); */

    return beers.map((HiveBeer beer) => beer.toStoredBeer());
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
