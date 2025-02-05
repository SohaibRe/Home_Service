import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // تهيئة التحكم في الرسوميات المتحركة
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), 
    );

    
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    // بدء الرسوميات المتحركة
    _controller.forward();

    // تأخير الانتقال إلى الشاشة التالية
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/onboarding');
    });
  }

  @override
  void dispose() {
    // التخلص من المتحكم عند إغلاق الشاشة
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255), 
      body: Center(
        child: FadeTransition(
          opacity: _animation, // تطبيق الرسوميات المتحركة
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // عرض الصورة
              Image.asset(
                'images/a.png', 
                width: 400, 
                height: 400, 
                fit: BoxFit.contain, 
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error, size: 100); 
                },
              ),
              const SizedBox(height: 20), 
              const Text(
                'Home Services', 
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}