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
                        'https://sun9-77.userapi.com/s/v1/ig2/AydvCc2uJ-ok9i9G--1DwSyTRn9jywSOTsEaTrTy3eRPiBo6-lCjx9b0pRII7p8vjTlAIUQXL3aU77EZgu9CrkPP.jpg?quality=96&as=32x57,48x85,72x128,108x192,160x284,240x426,360x640,480x853,540x959,640x1137,720x1279,900x1599&from=bu&u=ZNuATksXm4fPQjYWrUKmPRG7gk69ta_wKlBi9JJhodo&cs=340x604'),
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