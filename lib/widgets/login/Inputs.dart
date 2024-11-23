import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const InputWidget({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: widget.emailController,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
            labelText: 'Ingrese su email...',
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: widget.passwordController,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
            labelText: 'Ingrese su contraseña...',
          ),
          obscureText: true,
        ),
      ],
    );
  }
}
