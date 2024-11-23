import 'package:bookstore_mobile_app/models/Productos.dart';
import 'package:bookstore_mobile_app/screens/Cart/Cart.dart';
import 'package:bookstore_mobile_app/screens/CheckoutScreen.dart';
import 'package:bookstore_mobile_app/screens/OrderHistoryScreen.dart';
import 'package:bookstore_mobile_app/screens/administradorCatalogos/AdministradorCatalogos.dart';
import 'package:bookstore_mobile_app/screens/home/HomeScreen.dart';
import 'package:bookstore_mobile_app/screens/login/LoginScreen.dart';
import 'package:bookstore_mobile_app/screens/profile/Profile.dart';
import 'package:bookstore_mobile_app/screens/register/RegisterScreen.dart';
import 'package:bookstore_mobile_app/services/CartProvider.dart';
import 'package:bookstore_mobile_app/services/authServices.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
     MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => CartProvider()), 
      ],
      child: MyApp(),
    ),
  );
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
        '/cart': (context)=>CartScreen(),
        '/checkout': (context)=>CheckoutScreen(),
        '/history': (context)=>OrderHistoryScreen(),
      },
      initialRoute: '/',
    );
  }
}