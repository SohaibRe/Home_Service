import 'package:flutter/material.dart';

class AccessLocationScreen extends StatelessWidget {
  const AccessLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الوصول إلى الموقع')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_on, size: 100, color: Colors.blue),
            const SizedBox(height: 20),
            const Text('يرجى السماح بالوصول إلى موقعك'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/service_providers');
              },
              child: const Text('السماح'),
            ),
          ],
        ),
      ),
    );
  }
}
