import 'package:trop_dart/ui/screens/shared/model/beer.dart';

abstract class BeerService {
  Future<void> init();

  Future<Iterable<StoredBeer>> getStoredBeers();

  Future<void> generateBeer(int id, Beer data);

  Future<BeerService> get beerServices;
}

class StoredBeer {
  StoredBeer({this.id, this.name, this.date, this.latitude, this.longitude});

  final int id;
  final String name;
  final DateTime date;
  final double latitude;
  final double longitude;

  Beer toBeer() => Beer(
        name: name,
        date: date,
        latitude: latitude,
        longitude: longitude,
      );
}
