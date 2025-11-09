// lib/ui/forgot_password_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/forgot_password_bloc.dart';
import '../bloc/forgot_password_event.dart';
import '../bloc/forgot_password_state.dart';
import '../repository/auth_repository.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgotPasswordBloc(AuthRepository()),
      child: Scaffold(
        appBar: AppBar(title: Text("Forgot Password")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
            listener: (context, state) {
              if (state is ForgotPasswordSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Password reset email sent!")),
                );
              } else if (state is ForgotPasswordFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Error: ${state.error}")),
                );
              }
            },
            builder: (context, state) {
              if (state is ForgotPasswordLoading) {
                return Center(child: CircularProgressIndicator());
              }

              return Column(
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: "Enter your email"),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final email = emailController.text.trim();
                      if (email.isNotEmpty) {
                        context
                            .read<ForgotPasswordBloc>()
                            .add(ForgotPasswordSubmitted(email));
                      }
                    },
                    child: Text("Send Reset Link"),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
