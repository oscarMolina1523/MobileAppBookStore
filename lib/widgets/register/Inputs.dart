import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const InputWidget({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
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
            labelText: 'Enter your email or username...',
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: widget.passwordController,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
            labelText: 'Enter your password...',
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: widget.confirmPasswordController,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
            labelText: 'Confirm your password...',
          ),
        ),
      ],
    );
  }
}
