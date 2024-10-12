import 'package:bookstore_mobile_app/widgets/login/Button.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("My profile"),
        actions: [
          IconButton(
            onPressed:(){
              setState: ((){});
            },
            icon:const Icon(Icons.refresh_rounded)
          ),
        ]
      ),
      body: Center(
        child: Column(
          children: [
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
                        'https://moure.dev/avatar.jpg'),
                  ),
                ],
              ),
            ),
            const Text("Desea actualizar sus datos?", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20,),
            SizedBox(
              width: 300, // Ajustamos el ancho del campo de texto
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  labelText: 'Enter your new email',
                ),
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              width: 300, // Ajustamos el ancho del campo de texto
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  labelText: 'Enter your new user name',
                ),
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              width: 300, // Ajustamos el ancho del campo de texto
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  labelText: 'Enter your new password',
                ),
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              width: 300,
              child: ButtonWidget(),
            ),
          ],
        ),
      )
    );
  }
}