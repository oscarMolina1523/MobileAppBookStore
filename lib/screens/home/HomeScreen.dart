import 'package:bookstore_mobile_app/models/Categorias.dart';
import 'package:bookstore_mobile_app/screens/ProductosPorCategoriaScreen.dart';
import 'package:bookstore_mobile_app/services/apiService.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final ApiService apiService = ApiService(); // Instancia del servicio API

  HomeScreen({super.key});

  // Método para obtener la imagen correspondiente a cada categoría
  String getImageForCategory(String descripcion) {
    switch (descripcion.toLowerCase()) {
      case 'guías de viaje':
        return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMxUEgnFgDamO9IWTcIOX36J72bykbSoSnXw&s"; // Imagen de libros
      case 'novelas gráficas':
        return "https://media.revistagq.com/photos/5cdfbc01cb3e9784265fa3e0/master/pass/unnamed.jpg"; // Imagen de hojas
      case 'papelería':
        return "https://cdn-icons-png.flaticon.com/512/2795/2795648.png"; // Imagen de cartulinas
      case 'cuadernos':
        return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzK8yPLiDLx4qdgOCqqrS0qrg3YfG9vHOarg&s"; // Imagen de lápiz
      case 'juegos de mesa':
        return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmRzmyY1cO9EPlGsp78KAk5Nso6Bc_vkeamw&s"; // Imagen de lapiceros
      case 'libros de ciencia':
        return "https://quo.eldiario.es/imagenes_quo/es.h-cdn.co/quoes/images/ciencia/10-libros-que-te-haran-amar-la-ciencia-este-verano/libros11/1355426-1-esl-ES/libros11.jpg?resize=480:*"; // Imagen de colores
      case 'lapiceros':
        return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5SsL7saQ2Sfw-b5FuFaH54z-m7s25fNoJ7Q&s"; // Imagen de colores
      case 'lapiz de colores':
        return "https://www.torre.cl/wp-content/uploads/2021/12/Lapices-de-colores.jpg"; // Imagen de colores
      case 'libros de autoayuda':
        return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1J31pZN75myY2JDX4tietpSWGFShB7YuQBw&s"; // Imagen de colores
      case 'libros de historia':
        return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRCH8Zo-ozLUD2dYv5feP61SXXvRsP7ZpMiw&s"; // Imagen de colores
      case 'libros de cocina':
        return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7s62FO5Ohl1mwXs4rYp89zFPbkLaYp196uQ&s"; // Imagen de colores
      case 'libros de negocios':
        return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPHSpitGh-CwKo4QFy_uHrFx9lns6aLJOzDw&s"; // Imagen de colores
      case 'mochilas':
        return "https://i5.walmartimages.com/asr/6e16762d-4591-47a5-b09a-2f913a116451.a69138e19e58785193111e4940a7bcad.jpeg"; // Imagen de colores
      case 'libros de ficción':
        return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDuAbvxIoMVnZS0HbQXY_sLsWDdEKD0oBFPg&s"; // Imagen de colores
      case 'calendarios':
        return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ94PYn6DOK2EZ332txdvOvq9D6OqF7pL9TXQ&s"; // Imagen de colores
      case 'libros de psicología':
        return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4QQ3zJSNloBcFosULfTp6Z50U-vr7WOlIZA&s"; // Imagen de colores
      case 'libros de texto':
        return "https://previews.123rf.com/images/merzavka/merzavka1211/merzavka121100062/16403685-grupo-de-los-libros-de-texto-abiertos-para-la-educaci%C3%B3n.jpg"; // Imagen de colores
      case 'cómics':
        return "https://i.pinimg.com/originals/56/3e/26/563e26487a6afa5f98355d9a3bc3c49c.jpg"; // Imagen de colores
      case 'libros de fantasía':
        return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIPPOLywx80BQddr21iWTs9ZQFKvmLS98HeA&s"; // Imagen de colores
      case 'material de arte':
        return "https://i0.wp.com/evemuseografia.com/wp-content/uploads/2020/11/EVE13112020.jpg?fit=1170%2C696&ssl=1"; // Imagen de colores
      case 'literatura infantil':
        return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwzHL2P7TIA24u9ZhBG_fJeqZF_q5LazPKzA&s"; // Imagen de colores
      case 'cartulina':
        return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9pTfP0PTBtUQwKTeGM3xegkBP6hW9aQne0A&s"; // Imagen de colores
      case 'hojas':
        return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTacg4uhG5L2abgCeS-8pQNWrOAYpmiwdZbuw&s"; // Imagen de colores
      case 'libros de no ficción':
        return "https://static01.nyt.com/images/2018/12/07/universal/es/ZarateEspano0712/ZarateEspano0712-articleLarge.jpg?quality=75&auto=webp&disable=upscale"; // Imagen de colores
      case 'accesorios de oficina':
        return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQubrnTZpqZ0SGKJdEJY4lp6xqlAdPWP_qMBw&s"; // Imagen de colores
      case 'revistas':
        return "https://pic1.yitweb.co.il/cdn-cgi/image/f=auto,w=740,q=75/picserver/ynetespanol/crop_images/2024/04/30/H1eWxs9A110/H1eWxs9A110_0_0_740_985_0_large.jpg"; // Imagen de colores
      default:
        return "https://via.placeholder.com/100"; // Imagen por defecto si no coincide
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/profile');
          },
          child: const Padding(
            padding: EdgeInsets.all(4.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://moure.dev/avatar.jpg'),
            ),
          ),
        ),
        title: const Text("Eduardo Lau"),
        actions: [
          TextButton(
              onPressed: () {
                showMenu(
                  context: context,
                  position:
                      RelativeRect.fromLTRB(100, 80, 0, 0), // Posición del menú
                  items: [
                    PopupMenuItem(
                      value: '/profile',
                      child: Text('Mi Perfil'),
                    ),
                    PopupMenuItem(
                      value: '/cart',
                      child: Text('Mi carrito'),
                    ),
                    PopupMenuItem(
                      value: '/history',
                      child: Text('Historial'),
                    ),
                    PopupMenuItem(
                      value: '/',
                      child: Text('Cerrar Sesion'),
                    ),
                  ],
                ).then((value) {
                  if (value != null) {
                    Navigator.pushNamed(context, value);
                  }
                });
              },
              child: const Text("Opciones")),
        ],
      ),
      body: Container(
        color: Colors.green,
        child: FutureBuilder<List<Categoria>>(
          future: apiService.fetchCategorias(), // Llamada a la API para obtener categorías
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center (child: Text('No hay categorías disponibles.'));
            }
        
            final categorias = snapshot.data!; // Obtener las categorías
        
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 2, // Número de columnas
                crossAxisSpacing: 10, // Espacio entre columnas
                mainAxisSpacing: 10, // Espacio entre filas
                children: List.generate(categorias.length, (index) {
                  final categoria = categorias[index]; // Obtenemos la categoría de la lista
        
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductosPorCategoriaScreen(categoriaId: categoria.id), // Asegúrate de que el modelo tenga un campo `id`
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3), // Sombra simple
                            blurRadius: 5,
                            offset: const Offset(0, 3), // Desplazamiento de la sombra
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            getImageForCategory(categoria.descripcion), // Obtener la imagen según la descripción
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  categoria.descripcion,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            );
          },
        ),
      ),
    );
  }
}