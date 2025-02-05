import 'package:flutter/material.dart';

class CancelScreen extends StatelessWidget {
  final String orderId; // معرف الطلب
  final Function(String) onCancel; // دالة لإزالة الطلب

  const CancelScreen({
    super.key,
    required this.orderId,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController reasonController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('إلغاء الطلب')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('يرجى تحديد سبب الإلغاء'),
            const SizedBox(height: 20),
            TextField(
              controller: reasonController,
              decoration: const InputDecoration(
                labelText: 'سبب الإلغاء',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // إزالة الطلب من القائمة
                onCancel(orderId);
                Navigator.pop(context); // العودة إلى الشاشة السابقة
              },
              child: const Text('تأكيد الإلغاء'),
            ),
          ],
        ),
      ),
    );
  }
}