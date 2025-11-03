import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/login_bloc.dart';
import 'repository/auth_repository.dart';
import 'screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Create repository (simulated API)
    final authRepository = AuthRepository();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BLoC Login Demo',
      home: BlocProvider(
        // Provide LoginBloc to LoginScreen
        create: (context) => LoginBloc(authRepository, authRepository: null),
        child: const LoginScreen(),
      ),
    );
  }
}
