import 'package:flutter/material.dart';

class OrderApprovalScreen extends StatelessWidget {
  const OrderApprovalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('الطلبات الحالية'),
      //   backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      //   elevation: 5,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 5, // يمكن تعديل العدد هنا بناءً على عدد الطلبات
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // تفاصيل الطلب
                    const Text(
                      'تفاصيل الطلب',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text('الخدمة: صيانة كهربائية'),
                    const Text('التاريخ: 2024-01-15'),
                    const Text('السعر: 100 دينار'),
                    const Divider(height: 20),

                    // معلومات مزود الخدمة
                    const Text(
                      'معلومات مزود الخدمة',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text('الاسم: أحمد محمد'),
                    const Text('التقييم: 4.5 ⭐'),
                    const Divider(height: 20),

                    // أزرار الموافقة والرفض
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // منطق الموافقة على الطلب
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('تمت الموافقة على الطلب')),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          child: const Text('موافقة',
                              style: TextStyle(color: Colors.white)),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // منطق رفض الطلب
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('تم رفض الطلب')),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                          child: const Text(
                            'رفض',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}