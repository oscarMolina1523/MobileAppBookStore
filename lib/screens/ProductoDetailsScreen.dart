import 'package:bookstore_mobile_app/models/Productos.dart';
import 'package:bookstore_mobile_app/services/CartProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductoDetailsScreen extends StatelessWidget {
  final Productos producto;

  // Constructor para recibir el producto
  const ProductoDetailsScreen({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(producto.descripcion),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Verificar si la URL es válida
            producto.url != null
                ? Image.network(
                    producto.url!,
                    height: 200,
                    fit: BoxFit.cover,
                  )
                : Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: const Center(child: Text('Imagen no disponible')),
                  ),
            const SizedBox(height: 16),
            Text(
              'Descripción: ${producto.descripcion}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Precio: \$${producto.precio.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Agregar el producto al carrito con cantidad 1
                final cartProvider = Provider.of<CartProvider>(context, listen: false);
                cartProvider.addProduct(producto);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${producto.descripcion} agregado al carrito'),
                  ),
                );
              },
              child: const Text('Agregar al carrito'),
            )
          ],
        ),
      ),
    );
  }
}