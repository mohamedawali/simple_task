part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class LoadingUsers extends UserState {}

class LoadedUsers extends UserState {
  final List<UserModel> users;
  LoadedUsers(this.users);
}

class FailureState extends UserState {
  final String failure;
  FailureState(this.failure);
}
