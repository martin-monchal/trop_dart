import 'package:hive/hive.dart';
import 'package:trop_dart/data/beer/beer_interface.dart';
import 'package:trop_dart/ui/screens/shared/model/beer.dart';

part 'hive_beer.g.dart';

@HiveType(typeId: 0)
class HiveBeer extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  DateTime publicationDate;

  HiveBeer({this.id, this.publicationDate, this.name});

  HiveBeer.fromBeer(Beer beer, this.id)
      : publicationDate = DateTime.now(),
        name = beer.name;

  StoredBeer toStoredBeer() =>
      StoredBeer(id: id, name: name, date: publicationDate);
}
