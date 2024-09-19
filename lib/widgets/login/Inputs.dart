import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40)
            ),
            labelText: 'Enter your email or username...',
          ),
        ),
        SizedBox(height: 20,),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40)
            ),
            labelText: 'Enter your password...',
          ),
        ),
       ],
    );
  }
}