import 'package:bookstore_mobile_app/services/CartProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final wishlistItems = cartProvider.wishlistItems; // Obtiene los productos de la lista de deseos

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Deseos"),
      ),
      body: Column(
        children: [
          // Lista de productos en la lista de deseos
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: wishlistItems.isEmpty
                  ? Center(child: Text("La lista de deseos está vacía"))
                  : ListView.builder(
                      itemCount: wishlistItems.length,
                      itemBuilder: (context, index) {
                        final producto = wishlistItems[index]; // producto actual
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (producto.url != null)
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.network(
                                      producto.url!,
                                      height: 80,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          producto.descripcionProducto,
                                          style: const TextStyle(fontSize: 16),
                                          textAlign: TextAlign.left,
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          'Precio: C\$${producto.obtenerPrecio().toStringAsFixed(2)}',
                                          style: const TextStyle(fontSize: 14, color: Colors.grey),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red), // Ícono de basura en blanco
                                  onPressed: () {
                                    cartProvider.removeFromWishlist(producto); // Eliminar de la lista de deseos
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('${producto.descripcionProducto} eliminado de la lista de deseos'),
                                      ),
                                    );
                                  },
                                  color: Colors.red, // Color del botón rojo
                                  iconSize: 30,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}