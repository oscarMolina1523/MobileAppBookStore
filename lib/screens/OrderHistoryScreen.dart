import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../services/CartProvider.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final orders = cartProvider.orders;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Historial de Pedidos"),
      ),
      body: orders.isEmpty
          ? const Center(
              child: Text("No hay pedidos realizados"),
            )
          : ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fecha: ${DateFormat('dd/MM/yyyy HH:mm').format(order.date)}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        ...order.products.entries.map((entry) {
                          final producto = entry.key;
                          final cantidad = entry.value;
                          final totalProducto = producto.precio * cantidad;
                          return Text(
                            '${producto.descripcion} - '
                            'Cantidad: $cantidad - '
                            'Precio: \$${producto.precio.toStringAsFixed(2)} - '
                            'Subtotal: \$${totalProducto.toStringAsFixed(2)}',
                          );
                        }).toList(),
                        const SizedBox(height: 8),
                        Text(
                          'Total del pedido: \$${order.totalAmount.toStringAsFixed(2)}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
