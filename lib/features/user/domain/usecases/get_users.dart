// lib/features/user/domain/usecases/get_users.dart
import 'package:dartz/dartz.dart';
import 'package:userlist/features/user/domain/entities/user.dart';
import 'package:userlist/features/user/domain/repositories/user_repository.dart';

class GetUsers {
  final UserRepository repository;

  GetUsers(this.repository);

  Future<Either<Exception, List<User>>> call() {
    return repository.getUsers();
  }
}