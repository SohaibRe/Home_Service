import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:home_service/account/help_support_screen.dart';
import 'package:home_service/screens/notification_screen.dart';
import 'package:home_service/account/verification_screen.dart';
import 'package:home_service/city_location/access_location_screen.dart';
import 'package:home_service/l10n/app_localizations.dart';
import 'package:home_service/order/feedback_screen.dart';
import 'package:home_service/order/payment_screen.dart';
import 'package:home_service/providers/settings_provider.dart';
import 'package:home_service/screens/create_request_screen.dart';
import 'package:home_service/screens/home_screen.dart';
import 'package:home_service/screens/login_screen.dart';
import 'package:home_service/screens/onboarding_screen.dart';
import 'package:home_service/screens/order.dart';
import 'package:home_service/screens/signup_screen.dart';
import 'package:home_service/screens/splash_screen.dart';
import 'package:home_service/screens/about_screen.dart';
import 'package:home_service/services/services_list_screen.dart';
import 'package:home_service/services_provider/profile.dart';
import 'package:home_service/services_provider/profile_screen.dart';
import 'package:provider/provider.dart';
import 'screens/chat_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingsProvider(),
      child: const HomeServicesApp(),
    ),
  );
}

class HomeServicesApp extends StatefulWidget {
  const HomeServicesApp({super.key});

  // إضافة طريقة لتغيير اللغة
  static void setLocale(BuildContext context, Locale newLocale) {
    _HomeServicesAppState? state = context.findAncestorStateOfType<_HomeServicesAppState>();
    state?.changeLanguage(newLocale);
  }

  // إضافة طريقة لتغيير الوضع الليلي
  static void setThemeMode(BuildContext context, ThemeMode newThemeMode) {
    _HomeServicesAppState? state = context.findAncestorStateOfType<_HomeServicesAppState>();
    state?.changeTheme(newThemeMode);
  }

  @override
  State<HomeServicesApp> createState() => _HomeServicesAppState();
}

class _HomeServicesAppState extends State<HomeServicesApp> {
  Locale _locale = const Locale('ar', 'AE'); // اللغة الافتراضية
  ThemeMode _themeMode = ThemeMode.light; // الوضع الافتراضي

  // دالة لتغيير اللغة
  void changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  // دالة لتغيير الوضع الليلي
  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Services App',
      locale: _locale, 
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'AE'),
      ],
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData.light(), 
      darkTheme: ThemeData.dark(), 
      themeMode: _themeMode,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/home': (context) => const HomeScreen(),
        '/services_list': (context) => const ServicesListScreen(),
        '/payment': (context) => const PaymentScreen(),
        '/notification': (context) => NotificationScreen(),
        '/create_request': (context) => const CreateRequestScreen(),
        '/profile': (context) => const Profile(),
        '/chat': (context) => const ChatScreen(),
        '/order': (context) => const Orders(),
        '/access_location': (context) => const AccessLocationScreen(),
        '/profileScreen': (context) => const ProfileScreen(),
        '/help_support': (context) => const HelpSupportScreen(),
        '/feedback': (context) => const FeedbackScreen(),
        '/ver': (context) => const VerificationScreen(),
        '/about': (context) => const AboutScreen(),

      },
    );
  }
}