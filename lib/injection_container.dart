// lib/injection_container.dart
import 'package:get_it/get_it.dart';
import 'package:userlist/features/user/data/data_sources/user_local_data_source.dart';
import 'package:userlist/features/user/data/repositories/user_repository_impl.dart';
import 'package:userlist/features/user/domain/repositories/user_repository.dart';
import 'package:userlist/features/user/domain/usecases/add_user.dart';
import 'package:userlist/features/user/domain/usecases/delete_user.dart';
import 'package:userlist/features/user/domain/usecases/get_users.dart';
import 'package:userlist/features/user/domain/usecases/update_user.dart';
import 'package:userlist/features/user/presentation/blocs/user_bloc.dart';

final sl = GetIt.instance;

void init() {
  // Bloc
  sl.registerFactory(() => UserBloc(
    getUsers: sl(),
    addUser: sl(),
    updateUser: sl(),
    deleteUser: sl(),
  ));

  // Use cases
  sl.registerLazySingleton(() => GetUsers(sl()));
  sl.registerLazySingleton(() => AddUser(sl()));
  sl.registerLazySingleton(() => UpdateUser(sl()));
  sl.registerLazySingleton(() => DeleteUser(sl()));

  // Repository
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl()));

  // Data sources
  sl.registerLazySingleton<UserLocalDataSource>(() => UserLocalDataSourceImpl());
}
