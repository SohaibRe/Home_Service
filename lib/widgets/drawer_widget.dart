import 'package:flutter/material.dart';
import 'package:home_service/l10n/app_localizations.dart';
import 'package:home_service/main.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildHeader(context),
          _buildDrawerItem(
            icon: Icons.chat_bubble_outline,
            text: AppLocalizations.of(context)?.chat ?? 'الدردشة',
            onTap: () => Navigator.pushNamed(context, '/chat'),
          ),
          _buildDrawerItem(
            icon: Icons.person_outline,
            text: AppLocalizations.of(context)?.account ?? 'الحساب',
            onTap: () => Navigator.pushNamed(context, '/profileScreen'),
          ),
          _buildDrawerItem(
            icon: Icons.location_on_outlined,
            text: AppLocalizations.of(context)?.location ?? 'الموقع',
            onTap: () => Navigator.pushNamed(context, '/access_location'),
          ),
          const Divider(),
          _buildDrawerItem(
            icon: Icons.support_agent_outlined,
            text: AppLocalizations.of(context)?.support ?? 'الدعم والمساعدة',
            onTap: () => Navigator.pushNamed(context, '/help_support'),
          ),
          _buildDrawerItem(
            icon: Icons.settings_outlined,
            text: AppLocalizations.of(context)?.settings ?? 'الإعدادات',
            onTap: () => Navigator.pushNamed(context, '/settings'),
          ),
          _buildDrawerItem(
            icon: Icons.language,
            text: AppLocalizations.of(context)?.changeLanguage ?? 'تغيير اللغة',
            onTap: () => _changeLanguage(context),
          ),
          const Divider(),
          _buildThemeSwitch(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.lightBlueAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('images/سول.jpeg'),
            backgroundColor: Colors.white,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rezg',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  'BetterCallHomeService@email.com',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white70,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      onTap: onTap,
      hoverColor: Colors.blue.withOpacity(0.1),
    );
  }

  // دالة لتغيير لغة التطبيق بين العربية والإنجليزية
  void _changeLanguage(BuildContext context) {
    Locale newLocale = Localizations.localeOf(context).languageCode == 'en'
        ? const Locale('ar', 'AE')
        : const Locale('en', 'US');
    HomeServicesApp.setLocale(context, newLocale);
  }

  Widget _buildThemeSwitch() {
    return SwitchListTile(
      secondary: const Icon(Icons.dark_mode, color: Colors.blueAccent),
      title: Text(
        AppLocalizations.of(context)?.darkMode ?? 'Dark Mode',
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      value: isDarkMode,
      onChanged: (bool value) {
        setState(() {
          isDarkMode = value;
          HomeServicesApp.setThemeMode(
            context,
            value ? ThemeMode.dark : ThemeMode.light,
          );
        });
      },
    );
  }
}
