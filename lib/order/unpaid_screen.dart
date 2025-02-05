import 'package:flutter/material.dart';

class UnpaidScreen extends StatelessWidget {
  const UnpaidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // قائمة الطلبات غير المدفوعة (كمثال)
    final List<Map<String, dynamic>> unpaidOrders = [
      {"id": 1, "amount": 50, "date": "2024-12-01"},
      {"id": 2, "amount": 75, "date": "2024-12-05"},
      {"id": 3, "amount": 30, "date": "2024-12-10"},
    ];

    return Scaffold(
     
      body: unpaidOrders.isEmpty
          ? const Center(
              child: Text(
                'لا توجد طلبات غير مدفوعة حاليًا.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: unpaidOrders.length,
              itemBuilder: (context, index) {
                final order = unpaidOrders[index];
                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: const Icon(Icons.warning, color: Colors.red, size: 40),
                    title: Text(
                      'طلب رقم ${order["id"]}',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Text('المبلغ: ${order["amount"]} دينار - لم يتم الدفع'),
                        const SizedBox(height: 5),
                        Text(
                          'تاريخ الطلب: ${order["date"]}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    trailing: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/payment');
                      },
                      icon: const Icon(Icons.payment, color: Colors.white),
                      label: const Text('الدفع الآن', style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
