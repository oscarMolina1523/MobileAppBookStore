import 'package:bookstore_mobile_app/widgets/login/Button.dart';
import 'package:bookstore_mobile_app/widgets/login/Inputs.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Fondo verde con el avatar en la parte superior
            Container(
              color: Colors.green[900],
              width: double.infinity,
              height: MediaQuery.of(context).size.height *
                  0.4, // Toma el 40% de la pantalla
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    radius: 85.0,
                    backgroundImage: NetworkImage(
                        'https://www.tn8.tv/wp-content/uploads/2021/04/2_Er4JY8D.jpg'),
                  ),
                ],
              ),
            ),
            // Contenedor blanco con los inputs y el botón
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 50, color: Colors.green[900]),
                  ),
                  const SizedBox(height: 20),
                  InputWidget(
                    emailController: _emailController,
                    passwordController: _passwordController,
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  ButtonWidget(
                    emailController: _emailController,
                    passwordController: _passwordController,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.centerRight,
                    child: const Text(
                      "Forgot your password?",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: const Text(
                          "Do you need register?",
                          style: TextStyle(color: Colors.red),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
