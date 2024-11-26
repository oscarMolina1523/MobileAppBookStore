import 'package:flutter/material.dart';

class UserProfile with ChangeNotifier {
  String _username = 'Usuario';
  String _imageUrl = 'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';

  String get username => _username;
  String get imageUrl => _imageUrl;

  void updateUsername(String newUsername) {
    _username = newUsername;
    notifyListeners(); // Notificar a los oyentes sobre el cambio
  }

  void updateImageUrl(String newImageUrl) {
    _imageUrl = newImageUrl;
    notifyListeners(); // Notificar a los oyentes sobre el cambio
  }
}