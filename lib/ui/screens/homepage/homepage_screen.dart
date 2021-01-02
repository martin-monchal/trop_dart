import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trop_dart/ui/resources/app_colors.dart';
import 'package:trop_dart/data/beer/beer_interface.dart';
import 'package:trop_dart/app/app_services.dart';

void main() {
  runApp(HomePageScreen());
}

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    Iterable<StoredBeer> storedBeers =
        await ApplicationServices.beer.getStoredBeers();
    setState(() {
      _markers.clear();
      for (final beer in storedBeers) {
        debugPrint('test:' + beer.toString());
        if (beer.location != null) {
          final marker = Marker(
            markerId: MarkerId(beer.id.toString()),
            position: LatLng(beer.location.latitude, beer.location.longitude),
            infoWindow: InfoWindow(
              title: beer.name,
              snippet: DateFormat.yMMMd().format(beer.date).toString(),
            ),
          );
          _markers[beer.name] = marker;
          debugPrint('marker here:' + beer.name);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Beers map'),
          backgroundColor: AppColors.primary,
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: const LatLng(48.8566, 2.3522),
            zoom: 3,
          ),
          markers: _markers.values.toSet(),
        ),
      ),
    );
  }
}
