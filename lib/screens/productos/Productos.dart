import 'package:bookstore_mobile_app/models/Productos.dart';
import 'package:flutter/material.dart';

class ProductosScreen extends StatelessWidget {
  const ProductosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Productos> productos=[
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

    return Scaffold(
      appBar: AppBar(
        title: const Text("Productos"),
        actions: [
          IconButton(
            onPressed:(){
              setState:((){ });
            },
            icon:const Icon(Icons.refresh_rounded)
          ),
        ]
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
    );;
  }
}