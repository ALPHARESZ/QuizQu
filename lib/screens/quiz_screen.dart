import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../providers/quiz_provider.dart';
import '../widgets/question_card.dart';

class QuizScreen extends StatelessWidget {
  final String username;
  const QuizScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuizProvider>(context);
    final total = provider.questions.length;
    final question = provider.currentQuestion;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            provider.categoryName,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF3B56E0),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              LinearProgressIndicator(
                value: (provider.currentIndex + 1) / total,
                color: const Color(0xFF3B56E0),
                backgroundColor: const Color(0xFFE7E9F9),
                minHeight: 10,
                borderRadius: BorderRadius.circular(8),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: QuestionCard(question: question),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (provider.currentIndex > 0)
                    OutlinedButton(
                      onPressed: provider.previousQuestion,
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF3B56E0)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                      ),
                      child: const Text(
                        "Sebelumnya",
                        style: TextStyle(
                          color: Color(0xFF3B56E0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ElevatedButton(
                    onPressed: () {
                      if (provider.currentIndex == total - 1) {
                        final score = provider.calculateScore();
                        context.push('/result', extra: score);
                      } else {
                        provider.nextQuestion();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3B56E0),
                      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Text(
                      provider.currentIndex == total - 1 ? "Selesai" : "Selanjutnya",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
