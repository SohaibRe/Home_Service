import 'package:flutter/material.dart';
import 'package:home_service/l10n/app_localizations.dart';

class ServicesListScreen extends StatefulWidget {
  const ServicesListScreen({super.key});

  @override
  _ServicesListScreenState createState() => _ServicesListScreenState();
}

class _ServicesListScreenState extends State<ServicesListScreen> {
  // متغير للتحكم في حقل البحث
  TextEditingController searchController = TextEditingController();

  // قائمة لتخزين الخدمات التي سيتم عرضها بعد التصفية
  late List<Map<String, dynamic>> filteredServices;

  // قائمة لجميع الخدمات المتاحة
  late List<Map<String, dynamic>> services;

  @override
  void initState() {
    super.initState();
    // تهيئة قائمة الخدمات المصفاة كقائمة فارغة
    filteredServices = [];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // تحميل قائمة الخدمات عند تحميل الشاشة
    services = getServices(context);
    filteredServices = services;
  }

  // دالة لإرجاع قائمة الخدمات مع دعم الترجمة
  List<Map<String, dynamic>> getServices(BuildContext context) {
    return [
      {
        'title': AppLocalizations.of(context)?.homeCleaning ?? 'Home Cleaning',
        'icon': Icons.cleaning_services,
        'color': Colors.teal,
      },
      {
        'title': AppLocalizations.of(context)?.plumbing ?? 'Plumbing',
        'icon': Icons.plumbing,
        'color': Colors.blueAccent,
      },
      {
        'title': AppLocalizations.of(context)?.electricity ?? 'Electricity',
        'icon': Icons.electrical_services,
        'color': Colors.orangeAccent,
      },
      {
        'title': AppLocalizations.of(context)?.airConditioning ?? 'Air Conditioning',
        'icon': Icons.ac_unit,
        'color': Colors.cyan,
      },
      {
        'title': AppLocalizations.of(context)?.painting ?? 'Painting',
        'icon': Icons.format_paint,
        'color': Colors.deepPurple,
      },
      {
        'title': AppLocalizations.of(context)?.carpentry ?? 'Carpentry',
        'icon': Icons.carpenter,
        'color': Colors.brown,
      },
    ];
  }

  // دالة لتصفية الخدمات بناءً على البحث
  void filterServices(String query) {
    setState(() {
      if (query.isEmpty) {
        // إذا كان البحث فارغًا، تعرض كل الخدمات
        filteredServices = services;
      } else {
        // تصفية القائمة بناءً على النص المدخل
        filteredServices = services
            .where((service) => service['title']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // التحقق مما إذا كان الثيم داكنًا أم لا
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    Color textColor = isDark ? Colors.white : Colors.black87;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // مربع البحث
            Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              decoration: BoxDecoration(
                color: isDark ? Colors.black54 : Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                controller: searchController,
                onChanged: filterServices,
                style: TextStyle(color: textColor),
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)?.searchHint ?? 'ابحث عن خدمة...',
                  hintStyle: TextStyle(color: isDark ? Colors.white70 : Colors.black54),
                  prefixIcon: Icon(Icons.search, color: isDark ? Colors.white70 : Colors.blue),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                  filled: true,
                  fillColor: isDark ? Colors.black45 : Colors.white,
                ),
              ),
            ),
            // عنوان قائمة الخدمات
            Row(
              children: [
                const Text("|", style: TextStyle(color: Colors.blue, fontSize: 30)),
                Text(
                  AppLocalizations.of(context)?.servicesList ?? "قائمة الخدمات",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: textColor),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Expanded(
              child: GridView.builder(
                itemCount: filteredServices.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  crossAxisSpacing: 15, 
                  mainAxisSpacing: 15, 
                  childAspectRatio: 0.85,
                ),
                itemBuilder: (context, index) {
                  return _buildServiceCard(
                    context,
                    title: filteredServices[index]['title'],
                    icon: filteredServices[index]['icon'],
                    color: filteredServices[index]['color'],
                    isDark: isDark,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context,
      {required String title, required IconData icon, required Color color, required bool isDark}) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/create_request',
          arguments: {'serviceName': title},
        );
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDark
                ? [Colors.black87, Colors.black54]
                : [color.withOpacity(0.1), Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              offset: const Offset(0, 5),
              blurRadius: 15,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    isDark ? Colors.white10 : color.withOpacity(0.8),
                    isDark ? Colors.white24 : color.withOpacity(0.4)
                  ],
                  radius: 1.0,
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 40,
                color: isDark ? Colors.white70 : Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white70 : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
