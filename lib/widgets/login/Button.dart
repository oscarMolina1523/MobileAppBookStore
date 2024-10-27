import 'package:bookstore_mobile_app/services/authServices.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    void _validateCredentials() async {
      final String email = emailController.text;
      final String password = passwordController.text;

      if (email.isEmpty || password.isEmpty) {
        // Mostrar un mensaje de error si los campos están vacíos
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Por favor, completa todos los campos')),
        );
        return;
      }

      final authService = Provider.of<AuthService>(context, listen: false);
      String? result = await authService.login(email, password);

      if (result == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Inicio de sesión exitoso')),
        );
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(result)),
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
