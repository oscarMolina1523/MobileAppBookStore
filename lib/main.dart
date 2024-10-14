import 'package:bookstore_mobile_app/screens/Cart/Cart.dart';
import 'package:bookstore_mobile_app/screens/administradorCatalogos/AdministradorCatalogos.dart';
import 'package:bookstore_mobile_app/screens/home/HomeScreen.dart';
import 'package:bookstore_mobile_app/screens/login/LoginScreen.dart';
import 'package:bookstore_mobile_app/screens/productos/Productos.dart';
import 'package:bookstore_mobile_app/screens/profile/Profile.dart';
import 'package:bookstore_mobile_app/screens/register/RegisterScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:{
        '/': (context)=>LoginScreen(),
        '/register': (context)=>RegisterScreen(),
        '/home': (context)=>HomeScreen(),
        '/profile': (context)=>ProfileScreen(),
        '/catalogos': (context)=>AdministradorCatalogosScreen(),
        '/productos': (context)=>ProductosScreen(),
        '/cart': (context)=>CartScreen(),
      },
      initialRoute: '/',
    );
  }
}