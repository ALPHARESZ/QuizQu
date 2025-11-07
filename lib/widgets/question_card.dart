import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quiz_provider.dart';
import '../models/question.dart';
import 'answer_tile.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  const QuestionCard({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuizProvider>(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FF),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(2, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question.category.title, 
            style: const TextStyle(
              fontSize: 18, 
              fontWeight: FontWeight.w600,
              color: Color(0xFF3B56E0),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            question.question,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          ...List.generate(
            question.options.length,
            (index) => AnswerTile(
              text: question.options[index],
              selected: provider.isSelected(index),
              onTap: () => provider.selectAnswer(index),
            ),
          ),
        ],
      ),
    );
  }
}