import 'package:hive/hive.dart';
import 'package:trop_dart/data/beer/beer_interface.dart';
import 'package:trop_dart/ui/screens/shared/model/beer.dart';
import 'package:geolocator/geolocator.dart';

part 'hive_beer.g.dart';

@HiveType(typeId: 0)
class HiveBeer extends HiveObject {
  HiveBeer({this.id, this.name, this.publicationDate, this.location});
  HiveBeer.fromBeer(Beer beer, this.id)
      : publicationDate = DateTime.now(),
        location = beer.location,
        name = beer.name;

  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  DateTime publicationDate;

  @HiveField(3)
  Position location;

  StoredBeer toStoredBeer() =>
      StoredBeer(id: id, name: name, date: publicationDate, location: location);
}
