import 'package:flutter/material.dart';
import 'package:home_service/l10n/app_localizations.dart';
import 'package:home_service/services/service_providers_screen.dart';
import 'package:home_service/services/services_list_screen.dart';
import 'package:home_service/screens/order.dart';
import 'package:home_service/widgets/bottom_nav_bar.dart';
import 'package:home_service/widgets/drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const ServicesListScreen(),
    const ServiceProvidersScreen(),
    const Orders(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      appBar: _buildAppBar(context),
      drawer: const DrawerWidget(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      backgroundColor: isDark ? Colors.black : Colors.white,
      elevation: 3,
      title: Text(
       AppLocalizations.of(context)?.home ?? 'الرئيسية',
        style: TextStyle(
          color: isDark ? Colors.white : Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      actions: [
        // IconButton(
        //   icon: Icon(Icons.brightness_6, color: isDark ? Colors.white : Colors.black),
        //   onPressed: () {
        //     HomeServicesApp.setThemeMode(
        //       context,
        //       isDark ? ThemeMode.light : ThemeMode.dark,
        //     );
        //   },
        // ),
        IconButton(
          icon: Icon(Icons.notifications_none, color: isDark ? Colors.white : Colors.blueAccent),
          onPressed: () {
            Navigator.pushNamed(context, '/notification');
          },
        ),
      ],
    );
  }
}


