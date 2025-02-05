import 'package:flutter/material.dart';
import 'package:home_service/constants/colors.dart';
import 'package:home_service/l10n/app_localizations.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const BottomNavBar({super.key, 
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? Colors.black : Colors.white,
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black54 : AppColors.shadowColor,
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: isDark ? Colors.white70 : Colors.grey,
        type: BottomNavigationBarType.fixed,
        backgroundColor: isDark ? Colors.black : Colors.white,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_repair_service),
            label: AppLocalizations.of(context)?.services ?? 'الخدمات',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.people_alt),
            label: AppLocalizations.of(context)?.serviceProviders ?? 'مزودو الخدمة',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.assignment_outlined),
            label: AppLocalizations.of(context)?.orders ?? 'الطلبات',
          ),
        ],
      ),
    );
  }
}
