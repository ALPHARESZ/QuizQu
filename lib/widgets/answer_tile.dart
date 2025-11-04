import 'package:flutter/material.dart';

class AnswerTile extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const AnswerTile({
    super.key,
    required this.text,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF3B56E0) : Colors.white,
          border: Border.all(color: const Color(0xFF3B56E0)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selected ? Colors.white : const Color(0xFF3B56E0),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
