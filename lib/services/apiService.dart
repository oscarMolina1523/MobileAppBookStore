import 'dart:convert';
import 'package:bookstore_mobile_app/models/Categorias.dart';
import 'package:bookstore_mobile_app/models/Productos.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://libreriaestudianteapi-ccaxb4gkb5eghehn.canadacentral-01.azurewebsites.net/';

  Future<List<Categoria>> fetchCategorias() async {
    final response = await http.get(Uri.parse('${baseUrl}categoria/listar'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Categoria.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar categorías');
    }
  }

  Future<List<Productos>> fetchProductos() async {
    final response = await http.get(Uri.parse('${baseUrl}Producto/listar'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Productos.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar productos');
    }
  }
}