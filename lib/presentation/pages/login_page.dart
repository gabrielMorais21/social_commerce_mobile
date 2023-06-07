// login_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_commerce_mobile/presentation/cubits/login_cubit.dart';
import 'package:social_commerce_mobile/presentation/states/login_state.dart';
import '../../../../injection_container.dart' as di;

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = di.sl.get<LoginCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: BlocConsumer<LoginCubit, LoginState>(
        bloc: loginCubit,
        listener: (context, state) {
          if (state is LoginSuccessState) {
            // Navigate to the next screen on successful login
            Navigator.pushReplacementNamed(context, '/home');
          } else if (state is LoginFailureState) {
            // Show an error message
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Error'),
                content: Text('Login failed.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () {
                    final username = _usernameController.text;
                    final password = _passwordController.text;
                    loginCubit.login(username, password);
                  },
                  child: Text('Login'),
                ),
                SizedBox(height: 16.0),
                state is LoginLoadingState
                    ? CircularProgressIndicator()
                    : SizedBox.shrink(),
              ],
            ),
          );
        },
      ),
    );
  }
}
