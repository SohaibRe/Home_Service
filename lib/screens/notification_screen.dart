import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
   NotificationScreen({super.key});

  // بيانات الإشعارات (مثال)
  final List<Map<String, String>> notifications = [
    {
      'title': 'تأكيد الطلب',
      'content': 'تم تأكيد طلبك بنجاح وسيتم تنفيذه قريباً.',
      'time': 'منذ 3 دقائق',
      'status': 'new', 
    },
    {
      'title': 'تحديث الخدمة',
      'content': 'تم تحديث حالتك في الخدمة من "قيد الانتظار" إلى "قيد التنفيذ".',
      'time': 'منذ 1 ساعة',
      'status': 'read', 
    },
    {
      'title': 'إشعار من مزود الخدمة',
      'content': 'تم إرسال رسالة جديدة من مزود الخدمة. تحقق منها.',
      'time': 'منذ 2 ساعات',
      'status': 'new', 
    },
    {
      'title': 'تذكير بالدفع',
      'content': 'لم تقم بالدفع بعد. الرجاء إتمام الدفع في أقرب وقت.',
      'time': 'منذ 5 ساعات',
      'status': 'read', 
    },
    {
      'title': 'ملاحظة حول الخدمة',
      'content': 'يرجى التحقق من تفاصيل الخدمة لأنها قد تتطلب بعض التعديلات.',
      'time': 'منذ 1 يوم',
      'status': 'new', 
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الإشعارات')),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              leading: Icon(
                Icons.notifications,
                color: notification['status'] == 'new' ? Colors.blue : Colors.grey,
              ),
              title: Text(
                notification['title']!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: notification['status'] == 'new' ? Colors.blue : Colors.black,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(notification['content']!),
                  const SizedBox(height: 4),
                  Text(
                    notification['time']!,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              trailing: notification['status'] == 'new'
                  ? const Icon(Icons.circle, color: Colors.blue, size: 10)
                  : null,
              onTap: () {
               
              },
            ),
          );
        },
      ),
    );
  }
}
