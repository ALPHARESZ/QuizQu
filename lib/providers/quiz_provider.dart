import 'package:flutter/foundation.dart';


class QuizProvider extends ChangeNotifier {
  String _username = '';

  String get username => _username;

  void setUsername(String name) {
    _username = name;
    notifyListeners();
  }
}
