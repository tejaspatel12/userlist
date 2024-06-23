// lib/features/user/data/data_sources/user_local_data_source.dart
import 'package:userlist/features/user/data/models/user_model.dart';

abstract class UserLocalDataSource {
  Future<List<UserModel>> getUsers();
  Future<void> addUser(UserModel user);
  Future<void> updateUser(UserModel user);
  Future<void> deleteUser(String userId);
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final List<UserModel> _users = [];

  @override
  Future<List<UserModel>> getUsers() async {
    return _users;
  }

  @override
  Future<void> addUser(UserModel user) async {
    _users.add(user);
  }

  @override
  Future<void> updateUser(UserModel user) async {
    final index = _users.indexWhere((element) => element.id == user.id);
    if (index != -1) {
      _users[index] = user;
    }
  }

  @override
  Future<void> deleteUser(String userId) async {
    _users.removeWhere((user) => user.id == userId);
  }
}
