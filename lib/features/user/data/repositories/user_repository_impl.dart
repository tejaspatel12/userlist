// lib/features/user/data/repositories/user_repository_impl.dart
import 'package:dartz/dartz.dart';
import 'package:userlist/features/user/data/data_sources/user_local_data_source.dart';
import 'package:userlist/features/user/data/models/user_model.dart';
import 'package:userlist/features/user/domain/entities/user.dart';
import 'package:userlist/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource localDataSource;

  UserRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Exception, List<User>>> getUsers() async {
    try {
      final users = await localDataSource.getUsers();
      return Right(users);
    } catch (e) {
      return Left(Exception('Failed to fetch users'));
    }
  }

  @override
  Future<Either<Exception, void>> addUser(User user) async {
    try {
      final userModel = UserModel(id: user.id, name: user.name);
      await localDataSource.addUser(userModel);
      return Right(null);
    } catch (e) {
      return Left(Exception('Failed to add user'));
    }
  }

  @override
  Future<Either<Exception, void>> updateUser(User user) async {
    try {
      final userModel = UserModel(id: user.id, name: user.name);
      await localDataSource.updateUser(userModel);
      return Right(null);
    } catch (e) {
      return Left(Exception('Failed to update user'));
    }
  }

  @override
  Future<Either<Exception, void>> deleteUser(String userId) async {
    try {
      await localDataSource.deleteUser(userId);
      return Right(null);
    } catch (e) {
      return Left(Exception('Failed to delete user'));
    }
  }
}
