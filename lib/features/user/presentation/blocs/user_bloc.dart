// lib/features/user/presentation/blocs/user_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:userlist/features/user/domain/entities/user.dart';
import 'package:userlist/features/user/domain/usecases/add_user.dart';
import 'package:userlist/features/user/domain/usecases/delete_user.dart';
import 'package:userlist/features/user/domain/usecases/get_users.dart';
import 'package:userlist/features/user/domain/usecases/update_user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsers getUsers;
  final AddUser addUser;
  final UpdateUser updateUser;
  final DeleteUser deleteUser;

  UserBloc({required this.getUsers, required this.addUser, required this.updateUser, required this.deleteUser}) : super(UserInitial()) {
    on<GetUsersEvent>((event, emit) async {
      emit(UserLoading());
      final usersOrFailure = await getUsers();
      usersOrFailure.fold(
            (failure) => emit(UserError('Failed to fetch users')),
            (users) => emit(UserLoaded(users)),
      );
    });

    on<AddUserEvent>((event, emit) async {
      final addUserOrFailure = await addUser(event.user);
      addUserOrFailure.fold(
            (failure) => emit(UserError('Failed to add user')),
            (_) => add(GetUsersEvent()),
      );
    });

    on<UpdateUserEvent>((event, emit) async {
      final updateUserOrFailure = await updateUser(event.user);
      updateUserOrFailure.fold(
            (failure) => emit(UserError('Failed to update user')),
            (_) => add(GetUsersEvent()),
      );
    });

    on<DeleteUserEvent>((event, emit) async {
      final deleteUserOrFailure = await deleteUser(event.userId);
      deleteUserOrFailure.fold(
            (failure) => emit(UserError('Failed to delete user')),
            (_) => add(GetUsersEvent()),
      );
    });
  }
}
