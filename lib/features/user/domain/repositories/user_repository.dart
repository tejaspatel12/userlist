// lib/features/user/domain/repositories/user_repository.dart
import 'package:dartz/dartz.dart';
import 'package:userlist/features/user/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<Exception, List<User>>> getUsers();
  Future<Either<Exception, void>> addUser(User user);
  Future<Either<Exception, void>> updateUser(User user);
  Future<Either<Exception, void>> deleteUser(String userId);
}
