import 'package:flutter/material.dart';
import 'cancel_screen.dart';

class PendingOrdersScreen extends StatefulWidget {
  const PendingOrdersScreen({super.key});

  @override
  _PendingOrdersScreenState createState() => _PendingOrdersScreenState();
}

class _PendingOrdersScreenState extends State<PendingOrdersScreen> {
  // قائمة الطلبات الحالية كمثال
  List<Map<String, String>> pendingOrders = [
    {"id": "1", "service": "تنظيف المنزل", "date": "2024-12-01"},
    {"id": "2", "service": "صيانة السباكة", "date": "2024-12-03"},
    {"id": "3", "service": "غسيل الملابس", "date": "2024-12-05"},
  ];

  // دالة لإزالة الطلب من القائمة
  void _removeOrder(String orderId) {
    setState(() {
      pendingOrders.removeWhere((order) => order["id"] == orderId);
    });
  }

  // دالة لعرض نافذة تأكيد الإلغاء
  void _showCancelDialog(BuildContext context, String orderId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تأكيد الإلغاء'),
        content: Text('هل أنت متأكد أنك تريد إلغاء الطلب رقم $orderId؟'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // إغلاق النافذة
            },
            child: const Text('لا'),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              Navigator.of(context).pop(); // إغلاق النافذة
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CancelScreen(
                    orderId: orderId,
                    onCancel: _removeOrder,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.cancel, color: Colors.white),
            label: const Text('نعم، إلغاء'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pendingOrders.isEmpty
          ? const Center(
              child: Text(
                'لا توجد طلبات قيد الانتظار حاليًا.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: pendingOrders.length,
              itemBuilder: (context, index) {
                final order = pendingOrders[index];
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: const Icon(Icons.pending_actions,
                        color: Colors.orange, size: 40),
                    title: Text(
                      'طلب رقم ${order["id"]}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Text('الخدمة: ${order["service"]}'),
                        const SizedBox(height: 5),
                        Text('تاريخ الطلب: ${order["date"]}',
                            style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                    trailing: ElevatedButton.icon(
                      onPressed: () {
                        _showCancelDialog(context, order["id"]!); // تأكيد الإلغاء
                      },
                      icon: const Icon(Icons.cancel, color: Colors.white),
                      label: const Text(
                        'إلغاء',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
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