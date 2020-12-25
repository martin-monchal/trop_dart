part of 'app_bloc_impl.dart';

abstract class _AppEvent {
  const _AppEvent();
}

class _AddBeerEvent extends _AppEvent {
  final String beerName;
  final Position location;

  const _AddBeerEvent(this.beerName, this.location);
}

class _LoadBeersEvent extends _AppEvent {
  const _LoadBeersEvent();
}
