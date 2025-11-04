enum QuizCategory {dsa, hci, db, mp}

extension QuizCategoryExtension on QuizCategory {
  String get title {
    switch (this) {
      case QuizCategory.dsa:
        return 'Data Structures and Algorithms';
      case QuizCategory.hci:
        return 'Human-Computer Interaction';
      case QuizCategory.db:
        return 'Database Systems';
      case QuizCategory.mp:
        return 'Mobile Programming';
    }
  }
}

class Question {
  final String id;
  final QuizCategory category;
  final String question;
  final List<String> options;
  final int correctIndex;
  int? selectedIndex;

  Question({
    required this.id,
    required this.category,
    required this.question,
    required this.options,
    required this.correctIndex,
    this.selectedIndex,
  });

  bool get isCorrect => selectedIndex == correctIndex;
}
