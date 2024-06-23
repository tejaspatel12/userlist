// lib/features/user/domain/usecases/add_user.dart
import 'package:dartz/dartz.dart';
import 'package:userlist/features/user/domain/entities/user.dart';
import 'package:userlist/features/user/domain/repositories/user_repository.dart';

class AddUser {
  final UserRepository repository;

  AddUser(this.repository);

  Future<Either<Exception, void>> call(User user) {
    return repository.addUser(user);
  }
}