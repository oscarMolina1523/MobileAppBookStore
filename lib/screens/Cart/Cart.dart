import 'package:bookstore_mobile_app/screens/CheckoutScreen.dart';
import 'package:bookstore_mobile_app/services/CartProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems =
        cartProvider.cartItems; // Obtiene los productos del carrito

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: Column(
        children: [
          // Lista de productos
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: cartItems.isEmpty
                  ? Center(child: Text("El carrito está vacío"))
                  : ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final producto =
                            cartItems.keys.elementAt(index); // producto actual
                        final cantidad =
                            cartItems[producto]!; // cantidad del producto
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
                                  // Usa Expanded aquí
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          producto.descripcionProducto,
                                          style: const TextStyle(fontSize: 16),
                                          textAlign: TextAlign.left,
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          'Precio: C\$${producto.obtenerPrecio().toStringAsFixed(2)}',
                                          style: const TextStyle(
                                              fontSize: 14, color: Colors.grey),
                                          textAlign: TextAlign.left,
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          'Cantidad: $cantidad',
                                          style: const TextStyle(
                                              fontSize: 14, color: Colors.black),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.add),
                                      onPressed: () {
                                        cartProvider.addProduct(
                                            producto); // Incrementar cantidad
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed: () {
                                        cartProvider.removeProduct(
                                            producto); // Disminuir cantidad
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                '${producto.descripcionProducto} cantidad disminuida'),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
          // Resumen del carrito
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Total: C\$${cartProvider.totalAmount.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Navegar a la pantalla de checkout
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CheckoutScreen()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.green), // Color de fondo verde
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white), // Color del texto blanco
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      TextStyle(
                        fontWeight: FontWeight.bold, // Texto en negrita
                      ),
                    ),
                  ),
                  child: const Text('Confirmar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
