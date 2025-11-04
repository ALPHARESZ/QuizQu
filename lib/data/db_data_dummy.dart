import '../models/question.dart';

final List<Question> dbQuestions = [
  Question(
    id: '1',
    category: QuizCategory.db,
    question: 'SQL untuk mengambil semua data dari tabel users?',
    options: ['GET * FROM users', 'SELECT * FROM users', 'FETCH * users', 'READ users'],
    correctIndex: 1,
  ),
  Question(
    id: '2',
    category: QuizCategory.db,
    question: 'Normalisasi bertujuan untuk?',
    options: ['Mempercepat UI', 'Menghilangkan redundancy', 'Menambah kolom', 'Mengganti SQL'],
    correctIndex: 1,
  ),
  Question(
    id: '3',
    category: QuizCategory.db,
    question: 'Primary key harus bersifat?',
    options: ['Nullable', 'Unik dan tidak null', 'Tidak unik', 'Boleh duplikat'],
    correctIndex: 1,
  ),
  Question(
    id: '4',
    category: QuizCategory.db,
    question: 'ACID adalah properti untuk?',
    options: ['Desain UI', 'Database transactions', 'Memory management', 'Sorting algorithms'],
    correctIndex: 1,
  ),
  Question(
    id: '5',
    category: QuizCategory.db,
    question: 'Index di db digunakan untuk?',
    options: ['Meningkatkan performa query', 'Menambah ukuran file', 'Membuat backup', 'Mencegah duplicate'],
    correctIndex: 0,
  ),
];