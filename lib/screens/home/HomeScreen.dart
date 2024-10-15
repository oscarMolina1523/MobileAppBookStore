import 'package:bookstore_mobile_app/models/Assigment.dart';
import 'package:bookstore_mobile_app/models/Productos.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Productos> productos=[
      Productos(descripcion: "Libros", url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbcYFSdlG_heT0EDW99OlxKAoeEBA1-GwLrw&s"),
      Productos(descripcion: "Hojas", url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXXklj0fI-P46oJ99RSaLU1vQkGRfZXT5MIA&s"),
      Productos(descripcion: "Cartulinas", url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8NAtzVJBQtjqICEBIZNySlcLaOJYmRHYPfg&s"),
      Productos(descripcion: "Lapiz", url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj_G-Dw47zP5_ZxqomOa8Nj02UonYPukV9ZA&s"),
      Productos(descripcion: "Lapiceros", url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQy3p9cMbZskg8v07mXuFdYqirNj4UPBlLMkw&s"),
      Productos(descripcion: "Colores", url: "https://www.materialescolar.es/blog/wp-content/uploads/2016/03/artistic-2063_960_720-e1457341711570.jpg"),
      Productos(descripcion: "Borrador", url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtHgFPd4fsNwt22rRWdlIYcnPjbT1acKfsUw&s"),
      Productos(descripcion: "Pincel", url: "https://50568e3c.rocketcdn.me/wp-content/uploads/2022/06/000-PINCELES-ACUARELA-opt-768x512.jpg"),
      Productos(descripcion: "Porta lapiz", url: "https://dixman.com.bo/cdn/shop/products/1454202892_1024x.jpg?v=1638321991"),
    ];
  final List<Assigment> messages = [
    Assigment(
        text: "Administrar Catalogos",
        url:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNAfIjpMrVLM1pOOPw4caXaV_GdxZooxep1w&s",
        route: '/catalogos'),
    Assigment(
        text: "Productos",
        url:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBrKjNCAtC4DkIrwkYzrUenFFBNtF0ym874w&s",
        route: '/productos'),
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
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/profile');
          },
          child: const Padding(
            padding: EdgeInsets.all(4.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR32r0pwl79OIe7C4qV3zuByHE5sevX_AcY8g&s'),
            ),
          ),
        ),
        title: const Text("Eduardo Lau"),
        actions:[
          TextButton(
            onPressed: () {
              showMenu(
                context: context,
                position: RelativeRect.fromLTRB(100, 80, 0, 0), // Posición del menú
                items: [
                  PopupMenuItem(
                    value: '/profile',
                    child: Text('Profile'),
                  ),
                  PopupMenuItem(
                    value: '/cart',
                    child: Text('My Cart'),
                  ),
                  PopupMenuItem(
                    value: '/',
                    child: Text('Cerrar Sesion'),
                  ),
                ],
              ).then((value) {
                // Acción cuando se selecciona una opción del menú
                if (value != null) {
                 Navigator.pushNamed(context, value);
                }
              });
            },
            child: const Text("Options")
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2, // Número de columnas
          crossAxisSpacing: 10, // Espacio entre columnas
          mainAxisSpacing: 10, // Espacio entre filas
          children: List.generate(productos.length, (index) {
            final message = productos[index]; // Obtenemos el mensaje de la lista

            return GestureDetector(
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
                    if (message.url != null) // Si la URL no es nula, mostrar imagen
                      Image.network(
                        message.url!,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        message.descripcion, // Mostramos el texto del mensaje
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
