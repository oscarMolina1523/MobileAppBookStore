import 'dart:convert';
import 'package:bookstore_mobile_app/models/Productos.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Importar la librería http

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
      total += producto.obtenerPrecio() * cantidad; // Calcular total
    });
    return total;
  }

  Future<void> confirmOrder(
      String name, String address, String cardNumber, String cvv) async {
    // Crear un nuevo pedido
    final order = Order(
      products:
          Map.from(_cartItems), // Crear una copia de _cartItems para el pedido
      totalAmount: totalAmount,
      date: DateTime.now(),
    );

    // Crear el cuerpo del JSON para la API
    final List<Map<String, dynamic>> detalles =
        order.products.entries.map((entry) {
      final producto = entry.key;
      final cantidad = entry.value;
      return {
        "NombreProducto": producto.descripcionProducto,
        "Cantidad": cantidad,
        "PrecioVenta": producto.obtenerPrecio(),
      };
    }).toList();

    final body = jsonEncode({
      "NombreCliente": name,
      "NombreUsuario": "admin", 
      "Total": order.totalAmount,
      "Detalles": detalles,
    });

    // Realizar la solicitud POST a la API
    final response = await http.post(
      Uri.parse(
          'https://libreriaestudianteapi-ccaxb4gkb5eghehn.canadacentral-01.azurewebsites.net/Venta/CrearVenta'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: body,
    );

    // Depuración: Imprimir los productos del pedido
    print("Productos en el pedido:");
    _cartItems.forEach((producto, cantidad) {
      print('${producto.descripcionProducto}: $cantidad');
    });

    if (response.statusCode == 200) {
      // Si la solicitud fue exitosa, agregar el pedido a la lista de pedidos
      _orders.add(order);
      // Limpiar el carrito
      _cartItems.clear();
      notifyListeners();
      print("Pedido enviado exitosamente.");
    } else {
      // Manejo de errores
      print(
          "Error al enviar el pedido: ${response.statusCode} - ${response.body}");
      throw Exception('Error al enviar el pedido');
    }
  }
}

// Clase para representar un pedido
class Order {
  final Map<Productos, int> products;
  final double totalAmount;
  final DateTime date;

  Order(
      {required this.products, required this.totalAmount, required this.date});
}
