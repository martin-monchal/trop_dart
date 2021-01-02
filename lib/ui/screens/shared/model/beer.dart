import 'package:geolocator/geolocator.dart';

class Beer {
  Beer({this.name, this.date, this.location});

  final String name;
  final DateTime date;
  final Position location;
}
