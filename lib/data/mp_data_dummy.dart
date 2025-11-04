import '../models/question.dart';

final List<Question> mpQuestions = [
  Question(
    id: '1',
    category: QuizCategory.mp,
    question: 'Widget paling dasar di Flutter untuk teks adalah?',
    options: ['TextView', 'UILabel', 'Text', 'Label'],
    correctIndex: 2,
  ),
  Question(
    id: '2',
    category: QuizCategory.mp,
    question: 'StatefulWidget cocok jika?',
    options: ['Tidak ada state', 'Perlu perubahan state', 'Hanya tampilan statis', 'Untuk icon saja'],
    correctIndex: 1,
  ),
  Question(
    id: '3',
    category: QuizCategory.mp,
    question: 'Hot reload berguna untuk?',
    options: ['Menghapus package', 'Melihat perubahan UI cepat', 'Build release', 'Install fonts'],
    correctIndex: 1,
  ),
  Question(
    id: '4',
    category: QuizCategory.mp,
    question: 'Flutter menggunakan bahasa?',
    options: ['Kotlin', 'Dart', 'Swift', 'JavaScript'],
    correctIndex: 1,
  ),
  Question(
    id: '5',
    category: QuizCategory.mp,
    question: 'Navigator in Flutter digunakan untuk?',
    options: ['Mengatur font', 'Navigasi antar-halaman', 'Membuat widget', 'Mengakses network'],
    correctIndex: 1,
  ),
];