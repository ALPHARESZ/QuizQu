import '../models/question.dart';

final List<Question> dsaQuestions = [
  Question(
    id: '1',
    category: QuizCategory.dsa,
    question: 'Apa kompleksitas rata-rata Quick Sort?',
    options: ['O(n)', 'O(n log n)', 'O(n^2)', 'O(log n)'],
    correctIndex: 1,
  ),
  Question(
    id: '2',
    category: QuizCategory.dsa,
    question: 'Struktur data mana cocok untuk FIFO?',
    options: ['Stack', 'Queue', 'Tree', 'Graph'],
    correctIndex: 1,
  ),
  Question(
    id: '3',
    category: QuizCategory.dsa,
    question: 'Traversal inorder pada binary search tree memberikan?',
    options: ['Preorder', 'Urutan menaik', 'Urutan menurun', 'Postorder'],
    correctIndex: 1,
  ),
  Question(
    id: '4',
    category: QuizCategory.dsa,
    question: 'Hash table menggunakan apa untuk mengatasi collision?',
    options: ['Recursion', 'Chaining', 'DFS', 'Greedy'],
    correctIndex: 1,
  ),
  Question(
    id: '5',
    category: QuizCategory.dsa,
    question: 'Apa keunggulan linked list dibanding array?',
    options: ['Akses random cepat', 'Alokasi memori dinamis', 'Ukuran tetap', 'Indexing O(1)'],
    correctIndex: 1,
  ),
];