import 'dart:math';

import 'package:geolocator/geolocator.dart';
import 'package:trop_dart/app/app_services.dart';
import 'package:trop_dart/data/beer/beer_interface.dart';
import 'package:trop_dart/ui/screens/shared/bloc/app_bloc.dart';
import 'package:trop_dart/ui/screens/shared/model/beer.dart';
import 'package:trop_dart/ui/utils/bloc.dart';

part 'app_event.dart';

class AppBloc extends BaseBloc<_AppEvent, AppState> {
  AppBloc() : super(_initialState()) {
    dispatch(_LoadBeersEvent());
  }

  static AppState _initialState() => AppState.loading();

  void addBeer(String beerName, Position location) {
    dispatch(_AddBeerEvent(beerName, location));
  }

  void loadMoreBeers() {
    dispatch(_LoadBeersEvent());
  }

  @override
  Stream<AppState> mapEventToState(_AppEvent event) async* {
    if (event is _AddBeerEvent) {
      int localBeerId = Random().nextInt(0x80000000);

      Beer beer = Beer(
        name: event.beerName,
        latitude: event.location.latitude,
        longitude: event.location.longitude,
      );

      await ApplicationServices.beer.generateBeer(localBeerId, beer);
      Iterable<StoredBeer> storedBeers =
          await ApplicationServices.beer.getStoredBeers();
      if (storedBeers == null) {
        yield AppState.error();
      } else {
        Iterable<Beer> items =
            storedBeers.map((StoredBeer storedBeer) => storedBeer.toBeer());
        yield AppState(items);
      }
    } else if (event is _LoadBeersEvent) {
      Iterable<StoredBeer> storedBeers =
          await ApplicationServices.beer.getStoredBeers();
      if (storedBeers == null) {
        yield AppState.error();
      } else {
        Iterable<Beer> items =
            storedBeers.map((StoredBeer storedBeer) => storedBeer.toBeer());
        yield AppState(items);
      }
    }
  }
}
