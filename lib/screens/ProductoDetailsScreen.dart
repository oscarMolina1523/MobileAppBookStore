import 'package:bookstore_mobile_app/models/Productos.dart';
import 'package:bookstore_mobile_app/services/CartProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductoDetailsScreen extends StatelessWidget {
  final Productos producto; final double precio; // Precio recibido

  // Constructor para recibir el producto y el precio
  const ProductoDetailsScreen({super.key, required this.producto, required this.precio});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(producto.descripcionProducto),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Center(
              child: producto.url != null
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
            ),
            const SizedBox(height: 16),
            Text(
              'Descripción: ${producto.descripcionProducto}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Precio: \$${precio.toStringAsFixed(2)}', // Mostrar el precio dinámico
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
                    content: Text('${producto.descripcionProducto} agregado al carrito'),
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