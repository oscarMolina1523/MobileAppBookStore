import 'package:bookstore_mobile_app/models/Productos.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Lista de cantidades para cada producto
  final List<int> _quantities = [0, 0, 0, 0, 0, 0];

  final List<Productos> messages = [
    Productos(
        descripcion: "Libros",
        url:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbcYFSdlG_heT0EDW99OlxKAoeEBA1-GwLrw&s",
        precio: 150),
    Productos(
        descripcion: "Hojas",
        url:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXXklj0fI-P46oJ99RSaLU1vQkGRfZXT5MIA&s",
        precio: 2),
    Productos(
        descripcion: "Cartulinas",
        url:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8NAtzVJBQtjqICEBIZNySlcLaOJYmRHYPfg&s",
        precio: 8),
    Productos(
        descripcion: "Lapiz",
        url:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj_G-Dw47zP5_ZxqomOa8Nj02UonYPukV9ZA&s",
        precio: 12),
    Productos(
        descripcion: "Lapiceros",
        url:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQy3p9cMbZskg8v07mXuFdYqirNj4UPBlLMkw&s",
        precio: 17),
    Productos(
        descripcion: "Colores",
        url:
            "https://www.materialescolar.es/blog/wp-content/uploads/2016/03/artistic-2063_960_720-e1457341711570.jpg",
        precio: 25),
  ];

  // Función para calcular el subtotal
  double _calculateSubtotal() {
    double subtotal = 0;
    for (int i = 0; i < messages.length; i++) {
      subtotal += _quantities[i] * messages[i].precio;
    }
    return subtotal;
  }

  // IVA (por ejemplo, 15%)
  double _calculateIVA(double subtotal) {
    return subtotal * 0.15;
  }

  // Función para calcular el total
  double _calculateTotal() {
    double subtotal = _calculateSubtotal();
    double iva = _calculateIVA(subtotal);
    return subtotal + iva;
  }

  @override
  Widget build(BuildContext context) {
    double subtotal = _calculateSubtotal();
    double iva = _calculateIVA(subtotal);
    double total = _calculateTotal();

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
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 2.5,
                  mainAxisSpacing: 10,
                ),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index]; // producto actual
                  return Container(
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (message.url != null)
                          Image.network(
                            message.url!,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment
                                .center, // Centra verticalmente
                            crossAxisAlignment: CrossAxisAlignment
                                .center, // Centra horizontalmente
                            children: [
                              Text(
                                message.descripcion,
                                style: const TextStyle(fontSize: 16),
                                textAlign: TextAlign
                                    .center, // Asegura que el texto esté centrado
                              ),
                              const SizedBox(
                                  height:
                                      5), // Espacio entre descripción y precio
                              Text(
                                'Precio: \$${message.precio.toStringAsFixed(2)}',
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.grey),
                                textAlign: TextAlign
                                    .center, // Asegura que el texto esté centrado
                              ),
                            ],
                          ),
                        ),

                        // Botones de suma y resta
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  if (_quantities[index] > 0) {
                                    _quantities[index]--; // Restar cantidad
                                  }
                                });
                              },
                            ),
                            Text(
                                '${_quantities[index]}'), // mostrar la cantidad
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  _quantities[index]++; // Sumar cantidad
                                });
                              },
                            ),
                          ],
                        ),
                      ],
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
                  'Subtotal: \$${subtotal.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  'IVA (15%): \$${iva.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  'Total: \$${total.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
