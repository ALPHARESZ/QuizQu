import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizqu/screens/home_screen.dart';

class InputUsernameScreen extends StatefulWidget {
  const InputUsernameScreen({super.key});

  @override
  State<InputUsernameScreen> createState() => _InputUsernameScreenState();
}

class _InputUsernameScreenState extends State<InputUsernameScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;

    double fontScale(double mobile, double tablet) =>
        isTablet ? tablet : mobile;
  
    final double topContainerHeight = size.height * 0.35;

    final double overlapOffset = size.height * 0.08;
     
    final double bottomContainerMinHeight = size.height - topContainerHeight + overlapOffset;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFD9D9D9),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: topContainerHeight,
                decoration: const BoxDecoration(
                  color: Color(0xFF3B56E0),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.1,
                    vertical: size.height * 0.05,
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
                        'QuizQu',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: fontScale(36, 46),
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
                    top: size.height * 0.04, 
                    bottom: size.height * 0.05,
                    left: size.width * 0.1,
                    right: size.width * 0.1,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(60), 
                      topRight: Radius.circular(60), 
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Selamat Datang',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: fontScale(26, 32),
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),

                      Text(
                        'Silahkan Isi Nama Anda Terlebih Dahulu',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: fontScale(16, 20),
                        ),
                      ),
                      SizedBox(height: size.height * 0.05),

                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: TextField(
                          controller: _nameController,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: fontScale(16, 18),
                          ),
                          decoration: InputDecoration(
                            hintText: 'Nama Pengguna',
                            hintStyle: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: fontScale(16, 18),
                              color: Colors.black.withOpacity(0.7),
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.07,
                              vertical: size.height * 0.02,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.07),
 
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            Future.delayed(const Duration(milliseconds: 200), () {
                              if (_nameController.text.trim().isNotEmpty) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        HomeScreen(username: _nameController.text.trim()),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Nama tidak boleh kosong!",
                                      style: TextStyle(fontFamily: 'Poppins'),
                                    ),
                                  ),
                                );
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF3B56E0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.02,
                            ),
                          ),
                          child: Text(
                            'Mulai Kuis',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: fontScale(16, 20),
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
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