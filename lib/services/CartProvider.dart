import 'package:bookstore_mobile_app/models/Productos.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  // Usamos un Map para almacenar el producto y su cantidad
  Map<Productos, int> _cartItems = {};

  Map<Productos, int> get cartItems => _cartItems;

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
}