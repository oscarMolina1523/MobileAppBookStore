import 'package:bookstore_mobile_app/models/Productos.dart';
import 'package:bookstore_mobile_app/screens/ProductoDetailsScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Productos> productos = [
    Productos(
        descripcion: "Libros",
        url:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbcYFSdlG_heT0EDW99OlxKAoeEBA1-GwLrw&s",
        precio: 150),
    Productos(
        descripcion: "Hojas",
        url:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXXklj0fI-P46oJ99RSaLU1vQkGRfZXT5MIA&s",
        precio: 2),
    Productos(
        descripcion: "Cartulinas",
        url:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8NAtzVJBQtjqICEBIZNySlcLaOJYmRHYPfg&s",
        precio: 8),
    Productos(
        descripcion: "Lapiz",
        url:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj_G-Dw47zP5_ZxqomOa8Nj02UonYPukV9ZA&s",
        precio: 12),
    Productos(
        descripcion: "Lapiceros",
        url:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQy3p9cMbZskg8v07mXuFdYqirNj4UPBlLMkw&s",
        precio: 17),
    Productos(
        descripcion: "Colores",
        url:
            "https://www.materialescolar.es/blog/wp-content/uploads/2016/03/artistic-2063_960_720-e1457341711570.jpg",
        precio: 25),
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
        actions: [
          TextButton(
              onPressed: () {
                showMenu(
                  context: context,
                  position:
                      RelativeRect.fromLTRB(100, 80, 0, 0), // Posición del menú
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
                      value: '/history',
                      child: Text('Historial'),
                    ),
                    PopupMenuItem(
                      value: '/',
                      child: Text('Cerrar Sesion'),
                    ),
                  ],
                ).then((value) {
                  if (value != null) {
                    Navigator.pushNamed(context, value);
                  }
                });
              },
              child: const Text("Options")),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2, // Número de columnas
          crossAxisSpacing: 10, // Espacio entre columnas
          mainAxisSpacing: 10, // Espacio entre filas
          children: List.generate(productos.length, (index) {
            final producto = productos[index]; // Obtenemos el producto de la lista

            return GestureDetector(
              onTap: () {
                // Navegar a la pantalla de detalles cuando se hace clic en un producto
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductoDetailsScreen(producto: producto),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3), // S ombra simple
                      blurRadius: 5,
                      offset: const Offset(0, 3), // Desplazamiento de la sombra
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (producto.url != null) // Si la URL no es nula, mostrar imagen
                      Image.network(
                        producto.url!,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            producto.descripcion,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 5), // Espacio entre descripción y precio
                          Text(
                            'Precio: \$${producto.precio.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
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