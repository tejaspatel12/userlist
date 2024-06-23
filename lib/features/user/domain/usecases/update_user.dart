// lib/features/user/domain/usecases/update_user.dart
import 'package:dartz/dartz.dart';
import 'package:userlist/features/user/domain/entities/user.dart';
import 'package:userlist/features/user/domain/repositories/user_repository.dart';

class UpdateUser {
  final UserRepository repository;

  UpdateUser(this.repository);

  Future<Either<Exception, void>> call(User user) {
    return repository.updateUser(user);
  }
}