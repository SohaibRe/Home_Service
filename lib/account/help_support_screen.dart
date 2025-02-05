import 'package:flutter/material.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'الدعم والمساعدة',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        elevation: 5,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // قسم الأسئلة الشائعة
              _buildSectionTitle('الأسئلة الشائعة'),
              _buildFAQItem(
                question: 'كيف يمكنني إلغاء طلب؟',
                answer:
                    'يمكنك إلغاء الطلب من خلال الذهاب إلى قائمة الطلبات والنقر على زر الإلغاء بجانب الطلب المطلوب.',
              ),
              _buildFAQItem(
                question: 'كيف يمكنني التواصل مع الدعم؟',
                answer:
                    'يمكنك التواصل مع الدعم من خلال النقر على "اتصل بنا" في هذه الصفحة.',
              ),
              _buildFAQItem(
                question: 'ما هي سياسة الخصوصية؟',
                answer:
                    'سياسة الخصوصية توضح كيفية تعاملنا مع بياناتك الشخصية. يمكنك الاطلاع عليها من خلال النقر على "سياسة الخصوصية".',
              ),

              const SizedBox(height: 20),

              // قسم الخيارات
              _buildSectionTitle('خيارات أخرى'),
              _buildOptionTile(
                icon: Icons.contact_support,
                title: 'اتصل بنا',
                onTap: () {
                },
              ),
              _buildOptionTile(
                icon: Icons.info,
                title: 'عن التطبيق',
                onTap: () => Navigator.pushNamed(context, '/about'),
              ),
              _buildOptionTile(
                icon: Icons.privacy_tip,
                title: 'سياسة الخصوصية',
                onTap: () {
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // بناء عنوان القسم
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  // بناء عنصر الأسئلة الشائعة
  Widget _buildFAQItem({required String question, required String answer}) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              answer,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.blue),
        onTap: onTap,
      ),
    );
  }
}