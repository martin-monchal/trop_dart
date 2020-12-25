// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AppStateTearOff {
  const _$AppStateTearOff();

// ignore: unused_element
  AppStateData call(Iterable<Beer> beers) {
    return AppStateData(
      beers,
    );
  }

// ignore: unused_element
  _Error error() {
    return _Error();
  }

// ignore: unused_element
  _Loading loading() {
    return _Loading();
  }
}

/// @nodoc
// ignore: unused_element
const $AppState = _$AppStateTearOff();

/// @nodoc
mixin _$AppState {
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(Iterable<Beer> beers), {
    @required TResult error(),
    @required TResult loading(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(Iterable<Beer> beers), {
    TResult error(),
    TResult loading(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(AppStateData value), {
    @required TResult error(_Error value),
    @required TResult loading(_Loading value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(AppStateData value), {
    TResult error(_Error value),
    TResult loading(_Loading value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  final AppState _value;
  // ignore: unused_field
  final $Res Function(AppState) _then;
}

/// @nodoc
abstract class $AppStateDataCopyWith<$Res> {
  factory $AppStateDataCopyWith(
          AppStateData value, $Res Function(AppStateData) then) =
      _$AppStateDataCopyWithImpl<$Res>;
  $Res call({Iterable<Beer> beers});
}

/// @nodoc
class _$AppStateDataCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements $AppStateDataCopyWith<$Res> {
  _$AppStateDataCopyWithImpl(
      AppStateData _value, $Res Function(AppStateData) _then)
      : super(_value, (v) => _then(v as AppStateData));

  @override
  AppStateData get _value => super._value as AppStateData;

  @override
  $Res call({
    Object beers = freezed,
  }) {
    return _then(AppStateData(
      beers == freezed ? _value.beers : beers as Iterable<Beer>,
    ));
  }
}

/// @nodoc
class _$AppStateData implements AppStateData {
  _$AppStateData(this.beers) : assert(beers != null);

  @override
  final Iterable<Beer> beers;

  @override
  String toString() {
    return 'AppState(beers: $beers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AppStateData &&
            (identical(other.beers, beers) ||
                const DeepCollectionEquality().equals(other.beers, beers)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(beers);

  @override
  $AppStateDataCopyWith<AppStateData> get copyWith =>
      _$AppStateDataCopyWithImpl<AppStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(Iterable<Beer> beers), {
    @required TResult error(),
    @required TResult loading(),
  }) {
    assert($default != null);
    assert(error != null);
    assert(loading != null);
    return $default(beers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(Iterable<Beer> beers), {
    TResult error(),
    TResult loading(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(beers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(AppStateData value), {
    @required TResult error(_Error value),
    @required TResult loading(_Loading value),
  }) {
    assert($default != null);
    assert(error != null);
    assert(loading != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(AppStateData value), {
    TResult error(_Error value),
    TResult loading(_Loading value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class AppStateData implements AppState {
  factory AppStateData(Iterable<Beer> beers) = _$AppStateData;

  Iterable<Beer> get beers;
  $AppStateDataCopyWith<AppStateData> get copyWith;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;
}

/// @nodoc
class _$_Error implements _Error {
  _$_Error();

  @override
  String toString() {
    return 'AppState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Error);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(Iterable<Beer> beers), {
    @required TResult error(),
    @required TResult loading(),
  }) {
    assert($default != null);
    assert(error != null);
    assert(loading != null);
    return error();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(Iterable<Beer> beers), {
    TResult error(),
    TResult loading(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(AppStateData value), {
    @required TResult error(_Error value),
    @required TResult loading(_Loading value),
  }) {
    assert($default != null);
    assert(error != null);
    assert(loading != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(AppStateData value), {
    TResult error(_Error value),
    TResult loading(_Loading value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements AppState {
  factory _Error() = _$_Error;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc
class _$_Loading implements _Loading {
  _$_Loading();

  @override
  String toString() {
    return 'AppState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(Iterable<Beer> beers), {
    @required TResult error(),
    @required TResult loading(),
  }) {
    assert($default != null);
    assert(error != null);
    assert(loading != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(Iterable<Beer> beers), {
    TResult error(),
    TResult loading(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(AppStateData value), {
    @required TResult error(_Error value),
    @required TResult loading(_Loading value),
  }) {
    assert($default != null);
    assert(error != null);
    assert(loading != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(AppStateData value), {
    TResult error(_Error value),
    TResult loading(_Loading value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AppState {
  factory _Loading() = _$_Loading;
}
