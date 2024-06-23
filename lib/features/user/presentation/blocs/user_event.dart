// lib/features/user/presentation/blocs/user_event.dart
part of 'user_bloc.dart';

abstract class UserEvent {}

class GetUsersEvent extends UserEvent {}

class AddUserEvent extends UserEvent {
  final User user;

  AddUserEvent(this.user);
}

class UpdateUserEvent extends UserEvent {
  final User user;

  UpdateUserEvent(this.user);
}

class DeleteUserEvent extends UserEvent {
  final String userId;

  DeleteUserEvent(this.userId);
}
