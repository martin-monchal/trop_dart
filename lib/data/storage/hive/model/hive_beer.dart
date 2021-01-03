import 'package:hive/hive.dart';
import 'package:trop_dart/data/beer/beer_interface.dart';
import 'package:trop_dart/ui/screens/shared/model/beer.dart';
import 'package:geolocator/geolocator.dart';

part 'hive_beer.g.dart';

@HiveType(typeId: 0)
class HiveBeer extends HiveObject {
  HiveBeer({
    this.id,
    this.name,
    this.publicationDate,
    this.latitude,
    this.longitude,
  });

  HiveBeer.fromBeer(Beer beer, this.id)
      : publicationDate = DateTime.now(),
        latitude = beer.latitude,
        longitude = beer.longitude,
        name = beer.name;

  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  DateTime publicationDate;

  @HiveField(3)
  double latitude;

  @HiveField(4)
  double longitude;

  StoredBeer toStoredBeer() => StoredBeer(
        id: id,
        name: name,
        date: publicationDate,
        latitude: latitude,
        longitude: longitude,
      );
}
