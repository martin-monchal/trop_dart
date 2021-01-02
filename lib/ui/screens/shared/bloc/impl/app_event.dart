part of 'app_bloc_impl.dart';

abstract class _AppEvent {
  const _AppEvent();
}

class _AddBeerEvent extends _AppEvent {
  const _AddBeerEvent(this.beerName, this.location);

  final String beerName;
  final Position location;
}

class _LoadBeersEvent extends _AppEvent {
  const _LoadBeersEvent();
}
