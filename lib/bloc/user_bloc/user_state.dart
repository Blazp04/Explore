part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoadingState extends UserState {}

final class UserLoadedState extends UserState {
  final UserModel user;
  UserLoadedState({required this.user});
}

final class UserErrorState extends UserState {
  final String error;
  UserErrorState({required this.error});
}
