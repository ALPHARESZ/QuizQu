import '../models/question.dart';

final List<Question> hciQuestions = [
  Question(
    id: '1',
    category: QuizCategory.hci,
    question: 'Prinsip  yang menekankan konsistensi disebut?',
    options: ['Feedback', 'Consistency', 'Affordance', 'Mapping'],
    correctIndex: 1,
  ),
  Question(
    id: '2',
    category: QuizCategory.hci,
    question: 'Warna, ukuran, dan kontras adalah bagian dari?',
    options: ['Usability', 'Aesthetics', 'Accessibility', 'Functionality'],
    correctIndex: 2,
  ),
  Question(
    id: '3',
    category: QuizCategory.hci,
    question: 'Affordance berarti?',
    options: ['Petunjuk fungsi', 'Bug', 'Kecepatan', 'Kompatibilitas'],
    correctIndex: 0,
  ),
  Question(
    id: '4',
    category: QuizCategory.hci,
    question: 'Heuristic evaluation dilakukan oleh?',
    options: ['Pengguna akhir', 'Evaluator ahli', 'Database', 'Compiler'],
    correctIndex: 1,
  ),
  Question(
    id: '5',
    category: QuizCategory.hci,
    question: 'User persona berguna untuk?',
    options: ['Desain API', 'Mewakilkan pengguna', 'Optimasi database', 'Testing unit'],
    correctIndex: 1,
  ),
];