import 'package:bookstore_mobile_app/widgets/login/Inputs.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
              height: MediaQuery.of(context).size.height * 0.4, // Toma el 40% de la pantalla
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
                    "Register",
                    style: TextStyle(fontSize: 50, color: Colors.green[900]),
                  ),
                  const SizedBox(height: 20),
                  InputWidget(emailController: _emailController,
                    passwordController: _passwordController,),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      labelText: 'Confirm your password...',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                      style: TextButton.styleFrom(backgroundColor: Colors.green[900] ,
                      foregroundColor: Colors.white ,
                      minimumSize: Size(double.infinity, 50)),
                      child: const Text('Continuar', style: TextStyle(fontSize: 18),),
                      onPressed: () {
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LoginScreen() )); estes para madar a poner la otra pantalla
                        // Navigator.of(context).pop();  este sirve para esconder esta pantalla en caso de no querer usar el push
                        Navigator.of(context).pushNamed('/home');
                      },
                  ),
                  // const SizedBox(height: 20),
                  // Container(
                  //   alignment: Alignment.centerRight,
                  //   child: const Text(
                  //     "Forgot your password?",
                  //     style: TextStyle(color: Colors.red),
                  //   ),
                  // ),
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: (){
                        Navigator.pushNamed(context, '/');
                      },
                      child: const Text("Do you have an account?",style: TextStyle(color: Colors.red),)
                    ),
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
