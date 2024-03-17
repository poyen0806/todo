import 'package:flutter/material.dart';

class ErrorMessageModel extends ChangeNotifier {
  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  set errorMessage(String message) {
    _errorMessage = message;
    notifyListeners();
  }
}
