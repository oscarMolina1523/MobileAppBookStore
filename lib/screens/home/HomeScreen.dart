import 'package:bookstore_mobile_app/models/Assigment.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Assigment> messages = [
    Assigment(
        text: "Administrar Catalogos",
        url:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNAfIjpMrVLM1pOOPw4caXaV_GdxZooxep1w&s",
        route: '/catalogos'),
    Assigment(
        text: "Perfil",
        url:
            "https://img.freepik.com/free-vector/vector-illustration-flower-colorful_341269-1462.jpg?size=338&ext=jpg&ga=GA1.1.2008272138.1726704000&semt=ais_hybrid",
        route: '/profile'),
    Assigment(
        text: "Compras",
        url:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBrKjNCAtC4DkIrwkYzrUenFFBNtF0ym874w&s",
        route: '/register'),
    Assigment(
        text: "Reportes",
        url:
            "https://i.pinimg.com/736x/d8/6d/4c/d86d4c84cf5b0a44d48223f9b32fb45e.jpg",
        route: '/home'),
    Assigment(
        text: "Inventario",
        url:
            "https://thumb.ac-illust.com/dd/dde7b0cc2302b30858967da8211f107e_t.jpeg",
        route: '/login'),
    Assigment(
        text: "Usuarios",
        url:
            "https://i.pinimg.com/564x/7b/95/bf/7b95bfa44bf3381911d9cb7bedf9405c.jpg",
        route: '/register'),
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR32r0pwl79OIe7C4qV3zuByHE5sevX_AcY8g&s'),
          ),
        ),
        title: const Text("Eduardo Jose Lau Chavez"),
        actions: <Widget>[
          MenuBar(
            children: <Widget>[
              SubmenuButton(
                menuChildren: <Widget>[
                  MenuItemButton(
                    onPressed: () {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(content: Text('Profile selected')),
                      // );
                    },
                    child: const Text('Profile'),
                  ),
                  MenuItemButton(
                    onPressed: () {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(content: Text('Home selected')),
                      // );
                    },
                    child: const Text('Home'),
                  ),
                ],
                child: const Text('Items'),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2, // Número de columnas
          crossAxisSpacing: 10, // Espacio entre columnas
          mainAxisSpacing: 10, // Espacio entre filas
          children: List.generate(messages.length, (index) {
            final message = messages[index]; // Obtenemos el mensaje de la lista

            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, message.route); // Navegación
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3), // Sombra simple
                      blurRadius: 5,
                      offset: const Offset(0, 3), // Desplazamiento de la sombra
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (message.url !=
                        null) // Si la URL no es nula, mostrar imagen
                      Image.network(
                        message.url!,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        message.text, // Mostramos el texto del mensaje
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
