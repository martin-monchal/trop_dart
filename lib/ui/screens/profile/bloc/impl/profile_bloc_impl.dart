import 'dart:io';

import 'package:trop_dart/ui/screens/profile/bloc/profile_bloc.dart';
import 'package:trop_dart/ui/utils/bloc.dart';

part 'profile_event.dart';

class ProfileBloc extends BaseBloc<_ProfileEvent, ProfileState> {
  final File initialImage;

  ProfileBloc({this.initialImage}) : super(_initialState(initialImage));

  static ProfileState _initialState(File image) => ProfileState(image: image);

  void changeProfilePicture(File image) {
    dispatch(_ChangeProfilePictureEvent(image));
  }

  @override
  Stream<ProfileState> mapEventToState(_ProfileEvent event) async* {
    if (event is _ChangeProfilePictureEvent) {
      if (event.image != null) {
        yield ProfileState(image: event.image);
      } else {
        yield ProfileState.error();
      }
    }
  }
}
