import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.green[900] ,
          foregroundColor: Colors.white ,
          minimumSize: Size(double.infinity, 50)),
          child: const Text('Continuar', style: TextStyle(fontSize: 18),),
          onPressed: () {
            // Navigator.of(context).push(MaterialPageRoute(builder: (contextr)=>RegisterScreen())); manda a llamar la otra pantalla
            Navigator.pushNamed(context, '/home');
          },
        );
  }
}