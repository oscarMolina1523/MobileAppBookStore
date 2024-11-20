import 'package:bookstore_mobile_app/models/Productos.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  Map<Productos, int> _cartItems = {};
  List<Order> _orders = []; // Lista para almacenar los pedidos

  Map<Productos, int> get cartItems => _cartItems;
  List<Order> get orders => _orders;

  void addProduct(Productos producto) {
    if (_cartItems.containsKey(producto)) {
      _cartItems[producto] = _cartItems[producto]! + 1; // Incrementar cantidad
    } else {
      _cartItems[producto] = 1; // Agregar nuevo producto con cantidad 1
    }
    notifyListeners(); // Notifica a los listeners sobre el cambio
  }

  void removeProduct(Productos producto) {
    if (_cartItems.containsKey(producto)) {
      if (_cartItems[producto]! > 1) {
        _cartItems[producto] = _cartItems[producto]! - 1; // Disminuir cantidad
      } else {
        _cartItems.remove(producto); // Eliminar producto si la cantidad es 1
      }
      notifyListeners();
    }
  }

  double get totalAmount {
    double total = 0.0;
    _cartItems.forEach((producto, cantidad) {
      total += producto.precio * cantidad; // Calcular total
    });
    return total;
  }

  void confirmOrder(String name, String address, String cardNumber, String cvv) {
    // Crear un nuevo pedido
    final order = Order(
      products: _cartItems,
      totalAmount: totalAmount,
      date: DateTime.now(),
    );

    // Agregar el pedido a la lista de pedidos
    _orders.add(order);

    // Limpiar el carrito
    _cartItems.clear();

    notifyListeners();
  }
}

// Clase para representar un pedido
class Order {
  final Map<Productos, int> products;
  final double totalAmount;
  final DateTime date;

  Order({required this.products, required this.totalAmount, required this.date});
}