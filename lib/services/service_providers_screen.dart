import 'package:flutter/material.dart';
import 'package:home_service/l10n/app_localizations.dart';

class ServiceProvidersScreen extends StatefulWidget {
  const ServiceProvidersScreen({super.key});

  @override
  _ServiceProvidersScreenState createState() => _ServiceProvidersScreenState();
}

class _ServiceProvidersScreenState extends State<ServiceProvidersScreen> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> filteredProviders = serviceProviders;

  // دالة لتصفية مزودي الخدمة
  void filterProviders(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredProviders = serviceProviders;
      } else {
        filteredProviders = serviceProviders
            .where((provider) =>
                provider['name'].toString().contains(query) ||
                provider['job'].toString().contains(query)) 
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Row(
          textDirection: TextDirection.rtl,
          children: [
            const Text(
              '|',
              style: TextStyle(fontSize: 24, color: Colors.blue),
            ),
            const SizedBox(width: 8),
            Text(
        AppLocalizations.of(context)?.serviceProviders ?? 'مزودي الخدمة',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            // ✅ مربع البحث
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: searchController,
                onChanged: filterProviders,
                decoration: InputDecoration(
                  hintText: 'ابحث عن مزود خدمة...',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.blue,
                  ),
                  filled: true,
                  fillColor: Colors.blue[50],
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            //  عرض مزودي الخدمة
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: filteredProviders.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 6,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage(filteredProviders[index]['image']),
                        radius: 30,
                      ),
                      title: Text(
                        filteredProviders[index]['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'التقييم: ${filteredProviders[index]['rating']}',
                            style: const TextStyle(fontSize: 14),
                          ),
                          Text(
                            'المهنة: ${filteredProviders[index]['job']}', // عرض المهنة
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      onTap: () {
                        // إرسال بيانات مزود الخدمة إلى شاشة Profile
                        Navigator.pushNamed(
                          context,
                          '/profile',
                          arguments: {
                            'name': filteredProviders[index]['name'],
                            'image': filteredProviders[index]['image'],
                            'rating': filteredProviders[index]['rating'],
                            'job': filteredProviders[index]['job'],
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// بيانات مزودي الخدمة 
final List<Map<String, dynamic>> serviceProviders = [
  {
    'name': 'أحمد الابيض',
    'image': 'images/walter.jpeg',
    'rating': '★★★★☆',
    'job': 'كهربائي', 
  },
  {
    'name': 'محمود سالم',
    'image': 'images/جيسي.jpeg', 
    'rating': '★★★★★',
    'job': 'سباك', 
  },
  {
    'name': 'سامي يوسف',
    'image': 'images/غوستافو.jpeg', 
    'rating': '★★★☆☆',
    'job': 'نجار', 
  },
  {
    'name': 'خالد إبراهيم',
    'image': 'images/مايك.jpeg',  
    'rating': '★★★★☆',
    'job': 'ميكانيكي',
  },
];
