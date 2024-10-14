import 'package:bookstore_mobile_app/models/Productos.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // una lista de contadores para cada producto
  final List<int> _quantities = [0, 0, 0, 0, 0, 0]; 

  final List<Productos> messages = [
    Productos(descripcion: "Libros", url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbcYFSdlG_heT0EDW99OlxKAoeEBA1-GwLrw&s"),
    Productos(descripcion: "Hojas", url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXXklj0fI-P46oJ99RSaLU1vQkGRfZXT5MIA&s"),
    Productos(descripcion: "Cartulinas", url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8NAtzVJBQtjqICEBIZNySlcLaOJYmRHYPfg&s"),
    Productos(descripcion: "Lapiz", url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj_G-Dw47zP5_ZxqomOa8Nj02UonYPukV9ZA&s"),
    Productos(descripcion: "Lapiceros", url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQy3p9cMbZskg8v07mXuFdYqirNj4UPBlLMkw&s"),
    Productos(descripcion: "Colores", url: "https://www.materialescolar.es/blog/wp-content/uploads/2016/03/artistic-2063_960_720-e1457341711570.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, // Número de columnas
            childAspectRatio: 2.5, // Ajustamos la relación ancho/alto para hacer más espacio para los suma y resta
            mainAxisSpacing: 10,
          ),
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final message = messages[index]; // cart actual
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
                    child: Text(
                      message.descripcion,
                      style: const TextStyle(fontSize: 16),
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
                      Text('${_quantities[index]}'), // mostrar la cantidad
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            _quantities[index]++; // sumar numero
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
    );
  }
}
