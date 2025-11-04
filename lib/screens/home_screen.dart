import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/category_card.dart';

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

    final List<Map<String, String>> categories = [
      {
        'title': 'Struktur Data dan Algoritma',
        'questions': '10 Pertanyaan',
        'time': '60 Menit',
        'image': 'assets/images/DSA.png',
      },
      {
        'title': 'Human Computer Interaction',
        'questions': '10 Pertanyaan',
        'time': '60 Menit',
        'image': 'assets/images/HCI.png',
      },
      {
        'title': 'Pemrograman Mobile',
        'questions': '10 Pertanyaan',
        'time': '60 Menit',
        'image': 'assets/images/MP.png',
      },
      {
        'title': 'Basis Data',
        'questions': '10 Pertanyaan',
        'time': '60 Menit',
        'image': 'assets/images/DB.png',
      },
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFD9D9D9),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Container(
                width: double.infinity,
                height: size.height * 0.25,
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
                      Text(
                        'Halo, $username',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: fontScale(36, 46),
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.05),

              // Daftar kategori
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
                child: Column(
                  children: List.generate(categories.length, (index) {
                    final item = categories[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: size.height * 0.03),
                      child: CategoryCard(
                        title: item['title']!,
                        questionCount: item['questions']!,
                        duration: item['time']!,
                        imagePath: item['image']!,
                        isSelected: index == 0,
                        primaryColor: primaryColor,
                        isTablet: isTablet,
                        onTap: () {
                          context.push('/result', extra: 0);
                        },
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 