import 'package:bookstore_mobile_app/models/Productos.dart';
import 'package:bookstore_mobile_app/screens/ProductoDetailsScreen.dart';
import 'package:bookstore_mobile_app/services/apiService.dart';
import 'package:flutter/material.dart';

class ProductosPorCategoriaScreen extends StatelessWidget {
  final String categoriaId; // ID de la categoría

  const ProductosPorCategoriaScreen({super.key, required this.categoriaId});

  @override
  Widget build(BuildContext context) {
    final ApiService apiService = ApiService(); // Instancia del servicio API

    return Scaffold(
      appBar: AppBar(
        title: Text('Productos de la Categoría'),
      ),
      body: Container(
        color: Colors.green,
        child: FutureBuilder<List<Productos>>(
          future: apiService.fetchProductosPorCategoria(categoriaId), // Llamada a la API para obtener productos por categoría
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No hay productos disponibles.'));
            }
        
            final productos = snapshot.data!; // Obtener los productos
        
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 2, // Número de columnas
                crossAxisSpacing: 10, // Espacio entre columnas
                mainAxisSpacing: 10, // Espacio entre filas
                children: List.generate(productos.length, (index) {
                  final producto = productos[index]; // Obtenemos el producto de la lista
        
                  return GestureDetector(
                    onTap: () {
                      // Navegar a la pantalla de detalles del producto
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductoDetailsScreen(producto: producto, precio: producto.obtenerPrecio()), // Pasar el producto y el precio
                        ),
                      );
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
                          // Aquí puedes agregar un widget para mostrar la descripción del producto
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              producto.descripcionProducto,
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
            );
          },
        ),
      ),
    );
  }
}