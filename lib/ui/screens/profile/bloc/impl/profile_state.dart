import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  factory ProfileState({File image}) = ProfileStateData;

  factory ProfileState.error() = _Error;
}
