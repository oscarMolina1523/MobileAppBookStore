import 'package:bookstore_mobile_app/services/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProfile = Provider.of<UserProfile>(context);
    final TextEditingController _usernameController = TextEditingController(text: userProfile.username);
    final TextEditingController _imageUrlController = TextEditingController(text: userProfile.imageUrl);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mi Perfil"),
      ),
      body: SingleChildScrollView( // Envolver el Column en un SingleChildScrollView
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: Colors.green[900],
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 85.0,
                      backgroundImage: NetworkImage(userProfile.imageUrl),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text("¿Desea actualizar sus datos?", style: TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    labelText: 'Ingrese nuevo nombre de usuario',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _imageUrlController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    labelText: 'Ingrese nueva URL de imagen',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Actualizar el nombre de usuario y la URL de la imagen
                  userProfile.updateUsername(_usernameController.text);
                  userProfile.updateImageUrl(_imageUrlController.text);
                },
                child: const Text('Actualizar Perfil'),
              ),
              const SizedBox(height: 20), // Espacio adicional para evitar que el botón esté pegado al borde
            ],
          ),
        ),
      ),
    );
  }
}