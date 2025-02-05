import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // الحصول على حجم الشاشة
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('الملف الشخصي'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        // استخدام SafeArea لضمان عدم تداخل المحتوى مع النتوءات أو الشقوق
        child: SafeArea(
          // استخدام SingleChildScrollView لضمان إمكانية التمرير عند ظهور محتوى أكبر من الشاشة
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // صورة الملف الشخصي مع ضبط الحجم بناءً على الشاشة
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: size.width * 0.18, // تقريباً 60 عندما تكون الشاشة بعرض 320-360
                      backgroundImage: const AssetImage('images/سول.jpeg'),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // الاسم
                const Center(
                  child: Text(
                    'Rezg',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // البريد الإلكتروني
                const Center(
                  child: Text(
                    'example@email.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                // رقم الهاتف
                const Center(
                  child: Text(
                    'رقم الهاتف: 123-456-7890',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // قسم "نبذة عني"
                const Text(
                  'نبذة عني:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'أنا مهندس برمجيات وأحب تطوير التطبيقات المبتكرة التي تجعل الحياة أسهل.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
                // قسم "الإحصائيات"
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatistic('الطلبات', '15'),
                    _buildStatistic('التقييم', '4.8'),
                    _buildStatistic('المتابعون', '120'),
                  ],
                ),
                const SizedBox(height: 20),
                // تفاصيل أخرى داخل Card
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const ListTile(
                    leading: Icon(Icons.edit, color: Colors.blue),
                    title: Text('تعديل الملف الشخصي'),
                  ),
                ),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: const Icon(Icons.payment, color: Colors.green),
                    title: const Text('طرق الدفع'),
                    onTap: () => Navigator.pushNamed(context, '/payment'),
                  ),
                ),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: const Icon(Icons.exit_to_app, color: Colors.red),
                    title: const Text('تسجيل الخروج'),
                    onTap: () => Navigator.pushNamed(context, '/logout'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // دالة لبناء إحصائية مع استخدام TextScaleFactor لضبط حجم النص حسب إعدادات الجهاز
  Widget _buildStatistic(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
