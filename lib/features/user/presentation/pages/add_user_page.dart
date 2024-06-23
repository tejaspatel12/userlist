// lib/features/user/presentation/pages/add_user_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userlist/features/user/domain/entities/user.dart';
import 'package:userlist/features/user/presentation/blocs/user_bloc.dart';
import 'package:uuid/uuid.dart';

class AddUserPage extends StatelessWidget {
  final User? user;

  AddUserPage({Key? key, this.user}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (user != null) {
      _nameController.text = user!.name;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(user == null ? 'Add User' : 'Edit User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (user == null) {
                  final newUser = User(id: Uuid().v4(), name: _nameController.text);
                  context.read<UserBloc>().add(AddUserEvent(newUser));
                } else {
                  final updatedUser = User(id: user!.id, name: _nameController.text);
                  context.read<UserBloc>().add(UpdateUserEvent(updatedUser));
                }
                Navigator.pop(context);
              },
              child: Text(user == null ? 'Add User' : 'Update User'),
            )
          ],
        ),
      ),
    );
  }
}
