import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBloc<E, S> extends Bloc<E, S> {
  E _lastEvent;

  BaseBloc(S initialState) : super(initialState);

  void dispatch(E event) {
    add(event);
  }

  void dispatchLastEvent() {
    if (_lastEvent != null) {
      dispatch(_lastEvent);
    }
  }

  void forceReload() {
    dispatchLastEvent();
  }

  @override
  void onEvent(E event) {
    _lastEvent = event;
    super.onEvent(event);
  }

  String get loggerTag => runtimeType.toString();
}
