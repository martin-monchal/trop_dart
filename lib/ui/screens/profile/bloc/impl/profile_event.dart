part of 'profile_bloc_impl.dart';

abstract class _ProfileEvent {
  const _ProfileEvent();
}

class _ChangeProfilePictureEvent extends _ProfileEvent {
  final File image;
  const _ChangeProfilePictureEvent(this.image);
}
