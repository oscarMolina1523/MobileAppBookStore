import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const ButtonWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    final String validEmail = 'jorge@gmail.com';
    final String validPassword = '123456';

    void _validateCredentials() {
      final String email = emailController.text;
      final String password = passwordController.text;

      if (email == validEmail && password == validPassword) {
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error: Invalid email or password')),
        );
      }
    }

    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.green[900],
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
      ),
      child: const Text(
        'Continuar',
        style: TextStyle(fontSize: 18),
      ),
      onPressed: _validateCredentials,
    );
  }
}
