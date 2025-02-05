import 'package:flutter/material.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('التحقق من الحساب')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text('أدخل رمز التحقق المرسل إلى بريدك الإلكتروني'),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'رمز التحقق',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: const Text('تأكيد'),
            ),
          ],
        ),
      ),
    );
  }
}
