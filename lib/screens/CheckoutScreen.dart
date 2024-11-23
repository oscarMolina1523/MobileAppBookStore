import 'package:bookstore_mobile_app/screens/OrderHistoryScreen.dart';
import 'package:bookstore_mobile_app/services/CartProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController cardNumberController = TextEditingController();
    final TextEditingController cvvController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(labelText: 'Dirección'),
            ),
            TextField(
              controller: cardNumberController,
              decoration: const InputDecoration(labelText: 'Número de tarjeta'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: cvvController,
              decoration: const InputDecoration(labelText: 'CVV (3 dígitos)'),
              keyboardType: TextInputType.number,
              maxLength: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Validar campos
                if (nameController.text.isEmpty ||
                    addressController.text.isEmpty ||
                    cardNumberController.text.isEmpty ||
                    cvvController.text.isEmpty) {
                  // Mostrar un mensaje de error si algún campo está vacío
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Por favor, complete todos los campos.')),
                  );
                  return; // Salir de la función si hay campos vacíos
                }

                final cartProvider = Provider.of<CartProvider>(context, listen: false);
                cartProvider.confirmOrder(
                  nameController.text,
                  addressController.text,
                  cardNumberController.text,
                  cvvController.text,
                );

                // Mostrar un mensaje de confirmación
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Confirmación"),
                    content: const Text("Pedido confirmado con éxito."),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Cerrar el diálogo
                          Navigator.of(context).pop(); // Regresar a la pantalla del carrito
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => OrderHistoryScreen()), // Navegar a la pantalla de historial de pedidos
                          );
                        },
                        child: const Text("Aceptar"),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Confirmar Pedido'),
            ),
          ],
        ),
      ),
    );
  }
}