import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String questionCount;
  final String duration;
  final String imagePath;
  final bool isSelected;
  final Color primaryColor;
  final bool isTablet;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.title,
    required this.questionCount,
    required this.duration,
    required this.imagePath,
    required this.isSelected,
    required this.primaryColor,
    required this.isTablet,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double borderWidth = isSelected ? 2 : 0;
    final Color borderColor = isSelected ? primaryColor : Colors.transparent;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor, width: borderWidth),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: isTablet ? 100 : 70,
                  height: isTablet ? 100 : 70,
                  color: Colors.grey[300],
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),

              // Detail
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: isTablet ? 18 : 14,
                        fontWeight: FontWeight.w600,
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.list_alt_rounded,
                            size: 16, color: Colors.grey),
                        const SizedBox(width: 6),
                        Text(
                          questionCount,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: isTablet ? 16 : 14,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.access_time,
                            size: 16, color: Colors.grey),
                        const SizedBox(width: 6),
                        Text(
                          duration,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: isTablet ? 16 : 14,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
