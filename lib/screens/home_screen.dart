import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../widgets/category_card.dart';
import '../providers/quiz_provider.dart';
import '../models/question.dart';

class HomeScreen extends StatelessWidget {
  final String username;

  const HomeScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final Color primaryColor = const Color(0xFF3B56E0);

    double fontScale(double mobile, double tablet) =>
        isTablet ? tablet : mobile;

    final double topContainerHeight = size.height * 0.35;
    final double overlapOffset = size.height * 0.08;
    final double bottomContainerMinHeight = size.height - topContainerHeight + overlapOffset;

    final List<Map<String, String>> categories = [
      {
        'title': 'Struktur Data dan Algoritma',
        'questions': '10 Pertanyaan',
        'time': '20 Menit',
        'image': 'assets/images/DSA.png',
      },
      {
        'title': 'Human Computer Interaction',
        'questions': '10 Pertanyaan',
        'time': '20 Menit',
        'image': 'assets/images/HCI.png',
      },
      {
        'title': 'Pemrograman Mobile',
        'questions': '10 Pertanyaan',
        'time': '20 Menit',
        'image': 'assets/images/MP.png',
      },
      {
        'title': 'Basis Data',
        'questions': '10 Pertanyaan',
        'time': '20 Menit',
        'image': 'assets/images/DB.png',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFD9D9D9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: topContainerHeight,
                decoration: BoxDecoration(
                  color: primaryColor,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.1,
                    vertical: size.height * 0.04,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/Logo.png',
                        width: isTablet ? 120 : 100,
                        height: isTablet ? 120 : 100,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: size.width * 0.04),
                      Expanded(
                        child: Text(
                          username,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: fontScale(36, 46),
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Transform.translate(
                offset: Offset(0, -overlapOffset),
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    minHeight: bottomContainerMinHeight,
                  ),
                  padding: EdgeInsets.only(
                    top: size.height * 0.05 + overlapOffset,
                    bottom: size.height * 0.05,
                    left: isTablet ? size.width * 0.1 : size.width * 0.06,
                    right: isTablet ? size.width * 0.1 : size.width * 0.06,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: List.generate(categories.length, (index) {
                          final item = categories[index];
                          QuizCategory category;
                          switch (index) {
                            case 0:
                              category = QuizCategory.dsa;
                              break;
                            case 1:
                              category = QuizCategory.hci;
                              break;
                            case 2:
                              category = QuizCategory.mp;
                              break;
                            case 3:
                              category = QuizCategory.db;
                              break;
                            default:
                              category = QuizCategory.db;
                          }

                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: isTablet ? size.height * 0.04 : size.height * 0.03,
                            ),
                            child: CategoryCard(
                              title: item['title']!,
                              questionCount: item['questions']!,
                              duration: item['time']!,
                              imagePath: item['image']!,
                              isSelected: false,
                              primaryColor: primaryColor,
                              isTablet: isTablet,
                              onTap: () {
                                final provider = Provider.of<QuizProvider>(context, listen: false);
                                provider.loadCategory(category);
                                context.go('/quiz');
                              },
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 