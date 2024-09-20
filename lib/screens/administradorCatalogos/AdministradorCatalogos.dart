import 'package:bookstore_mobile_app/models/Catalogos.dart';
import 'package:flutter/material.dart';

class AdministradorCatalogosScreen extends StatelessWidget {
  const AdministradorCatalogosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Catalogos> messages=[
      Catalogos(descripcion: "Producto"),
      Catalogos(descripcion: "Marca"),
      Catalogos(descripcion: "Material"),
      Catalogos(descripcion: "Unidad Medida"),
      Catalogos(descripcion: "Diseño"),
      Catalogos(descripcion: "Color"),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalogos"),
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
          children: List.generate(messages.length, (index) {
            final message = messages[index]; // Obtenemos el mensaje de la lista

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