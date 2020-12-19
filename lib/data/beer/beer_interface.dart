import 'package:trop_dart/ui/screens/shared/model/beer.dart';

abstract class BeerService {
  Future<void> init();

  Future<StoredBeer> getStoredBeer();

  Future<void> generateBeer(int id, Beer data);

  Future<BeerService> get beerServices;
}

class StoredBeer {
  final int id;
  final String name;
  final DateTime date;

  StoredBeer({this.id, this.name, this.date});
}
