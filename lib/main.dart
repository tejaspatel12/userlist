// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;
import 'features/user/presentation/blocs/user_bloc.dart';
import 'features/user/presentation/pages/home_page.dart';

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<UserBloc>()..add(GetUsersEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Clean Architecture',
        home: HomePage(),
      ),
    );
  }
}
