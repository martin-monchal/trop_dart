part of 'profile_bloc_impl.dart';

abstract class _ProfileEvent {
  const _ProfileEvent();
}

class _ChangeProfilePictureEvent extends _ProfileEvent {
  const _ChangeProfilePictureEvent(this.image);

  final File image;
}
