import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trop_dart/ui/screens/shared/model/beer.dart';

part 'app_state.freezed.dart';

@freezed
abstract class AppState with _$AppState {
  factory AppState(Iterable<Beer> beers) = AppStateData;

  factory AppState.error() = _Error;

  factory AppState.loading() = _Loading;
}
