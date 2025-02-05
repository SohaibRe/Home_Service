import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController _commentController = TextEditingController();
  final List<Map<String, String>> _comments = [
    {
      'user': 'عميل 1',
      'comment': 'خدمة ممتازة، أنصح الجميع بهذا المزود!',
    },
    {
      'user': 'عميل 2',
      'comment': 'التعامل كان محترفًا والخدمة سريعة.',
    },
  ];

  void _addComment() {
    if (_commentController.text.isNotEmpty) {
      setState(() {
        _comments.add({
          'user': 'أنت', 
          'comment': _commentController.text,
        });
        _commentController.clear(); // مسح حقل النص بعد الإضافة
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? provider =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (provider == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('تفاصيل مزود الخدمة'),
          backgroundColor: Colors.blue,
        ),
        body: const Center(
          child: Text(
            'لم يتم توفير بيانات مزود الخدمة.',
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(provider['name'] ?? 'مزود الخدمة'),
        backgroundColor: const Color.fromARGB(255, 250, 252, 255),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة مزود الخدمة
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(
                    provider['image'] ?? 'images/default_provider.png'),
              ),
            ),
            const SizedBox(height: 16),

            // اسم مزود الخدمة
            Center(
              child: Text(
                provider['name'] ?? 'غير معروف',
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            const SizedBox(height: 8),

            // تقييم مزود الخدمة
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 24),
                const SizedBox(width: 4),
                Text(
                  '${provider['rating'] ?? '0.0'} / 5.0',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // وصف مزود الخدمة
            const Text(
              'نبذة عن مزود الخدمة:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'يقدم هذا المزود خدمات عالية الجودة مع خبرة طويلة في المجال. '
              'هدفه الرئيسي هو تقديم أفضل تجربة للعملاء وضمان رضاهم التام.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 24),

            // زر طلب الخدمة
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // الانتقال إلى صفحة جدولة الخدمة
                  Navigator.pushNamed(context, '/schedule',
                      arguments: provider);
                },
                icon: const Icon(Icons.schedule, size: 24),
                label: const Text(
                  'طلب الخدمة',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  textStyle: const TextStyle(fontSize: 18),
                  backgroundColor: const Color.fromARGB(255, 177, 219, 179),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // قسم التعليقات
            const Text(
              'تعليقات العملاء:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // قائمة التعليقات
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _comments.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 2,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue.shade50,
                      child: const Icon(Icons.person, color: Colors.blue),
                    ),
                    title: Text(
                      _comments[index]['user'] ?? 'عميل',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      _comments[index]['comment'] ?? 'لا يوجد تعليق',
                      style: const TextStyle(fontSize: 14, height: 1.4),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),

            // مربع إضافة تعليق جديد
            const Text(
              'أضف تعليقك:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _commentController,
              decoration: InputDecoration(
                labelText: 'أكتب تعليقك هنا...',
                labelStyle: const TextStyle(fontSize: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _addComment,
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                backgroundColor: const Color.fromARGB(255, 158, 185, 212),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'إضافة تعليق',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}