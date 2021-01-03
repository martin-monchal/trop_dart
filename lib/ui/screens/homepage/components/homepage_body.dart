import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:trop_dart/ui/screens/profile/bloc/profile_bloc.dart';
import 'package:trop_dart/ui/screens/shared/bloc/app_bloc.dart';
import 'package:trop_dart/ui/screens/shared/model/beer.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Marker> _markers = <Marker>[];
    Iterable<Beer> items = <Beer>[];

    return BlocBuilder<AppBloc, AppState>(
      builder: (BuildContext context, AppState state) {
        items = state.when(
          (Iterable<Beer> data) => data,
          error: () => items,
          loading: () => items,
        );

        if (items != null) {
          for (Beer beer in items) {
            if (beer.location != null) {
              final marker = Marker(
                markerId: MarkerId(
                    'beer: ${beer.name} - ${beer.date.toIso8601String()}'),
                position:
                    LatLng(beer.location.latitude, beer.location.longitude),
                infoWindow: InfoWindow(
                  title: beer.name,
                  snippet: DateFormat.yMMMd().format(beer.date).toString(),
                ),
              );
              _markers.add(marker);
              debugPrint('marker here:' + beer.name);
            }
          }
        }

        return GoogleMap(
          initialCameraPosition: CameraPosition(
            target: const LatLng(48.8566, 2.3522),
            zoom: 3,
          ),
          markers: _markers.toSet(),
        );
      },
    );
  }
}
