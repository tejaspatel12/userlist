// lib/features/user/domain/usecases/delete_user.dart
import 'package:dartz/dartz.dart';
import 'package:userlist/features/user/domain/repositories/user_repository.dart';

class DeleteUser {
  final UserRepository repository;

  DeleteUser(this.repository);

  Future<Either<Exception, void>> call(String userId) {
    return repository.deleteUser(userId);
  }
}