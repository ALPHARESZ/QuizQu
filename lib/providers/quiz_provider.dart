import 'package:flutter/foundation.dart';

import '../models/question.dart';
import '../data/db_data_dummy.dart';
import '../data/dsa_data_dummy.dart';
import '../data/hci_data_dummy.dart';
import '../data/mp_data_dummy.dart';

class QuizProvider extends ChangeNotifier {
  String _username = '';
  List<Question> _questions = [];
  int _currentIndex = 0;
  int? _selectedAnswer;
  QuizCategory? _category;

  void setUsername(String name) {
    _username = name;
    notifyListeners();
  }

  String get username => _username;
  List<Question> get questions => _questions;
  int get currentIndex => _currentIndex;
  Question get currentQuestion => _questions[_currentIndex];
  bool get isFinished => _currentIndex >= _questions.length - 1;
  String get categoryName => _category?.title ?? '';

  void loadCategory(QuizCategory category) {
    _category = category;
    switch (category) {
      case QuizCategory.db:
        _questions = List.from(dbQuestions);
        break;
      case QuizCategory.dsa:
        _questions = List.from(dsaQuestions);
        break;
      case QuizCategory.hci:
        _questions = List.from(hciQuestions);
        break;
      case QuizCategory.mp:
        _questions = List.from(mpQuestions);
        break;
    }
    _currentIndex = 0;
    _selectedAnswer = null;
    notifyListeners();
  }

  void selectAnswer(int index) {
    _selectedAnswer = index;
    // Simpan jawaban yang dipilih ke question
    _questions[_currentIndex].selectedIndex = index;
    notifyListeners();
  }

  bool isSelected(int index) => _selectedAnswer == index;

  void nextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      _currentIndex++;
      _selectedAnswer = _questions[_currentIndex].selectedIndex;
      notifyListeners();
    }
  }

  void previousQuestion() {
    if (_currentIndex > 0) {
      _currentIndex--;
      _selectedAnswer = _questions[_currentIndex].selectedIndex;
      notifyListeners();
    }
  }

  int calculateScore() {
    int score = 0;
    for (var q in _questions) {
      if (q.selectedIndex != null && q.selectedIndex == q.correctIndex) {
        score++;
      }
    }
    return score;
  }
}