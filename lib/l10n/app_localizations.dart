import 'package:flutter/material.dart';
import 'package:home_service/generated/intl/messages_all.dart';
import 'package:intl/intl.dart';

// محلي (Localizations) لإدارة الترجمة
class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  // للوصول إلى الترجمة داخل التطبيق
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  // دالة لتحميل الترجمة
  Future<void> load() async {
    await initializeMessages(locale.toString());
  }


  // الترجمة للنصوص المختلفة
// الوضع الليلي
  String get darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'darkMode',
      desc: 'Toggle dark mode option in drawer',
      locale: locale.toString(),
    );
  }
 String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: 'home screen title',
      locale: locale.toString(),
    );
  }
// الوضع النهاري (اختياري)
  String get lightMode {
    return Intl.message(
      'Light Mode',
      name: 'lightMode',
      desc: 'Toggle light mode option in drawer',
      locale: locale.toString(),
    );
  }

// خدمة تنظيف المنازل
  String get homeCleaning {
    return Intl.message(
      'Home Cleaning',
      name: 'homeCleaning',
      desc: 'Service for home cleaning',
      locale: locale.toString(),
    );
  }

// خدمة السباكة
  String get plumbing {
    return Intl.message(
      'Plumbing',
      name: 'plumbing',
      desc: 'Service for plumbing',
      locale: locale.toString(),
    );
  }

// خدمة الكهرباء
  String get electricity {
    return Intl.message(
      'Electricity',
      name: 'electricity',
      desc: 'Service for electrical work',
      locale: locale.toString(),
    );
  }

// خدمة التكييف
  String get airConditioning {
    return Intl.message(
      'Air Conditioning',
      name: 'airConditioning',
      desc: 'Service for air conditioning',
      locale: locale.toString(),
    );
  }

// خدمة الطلاء
  String get painting {
    return Intl.message(
      'Painting',
      name: 'painting',
      desc: 'Service for painting',
      locale: locale.toString(),
    );
  }

// خدمة النجارة
  String get carpentry {
    return Intl.message(
      'Carpentry',
      name: 'carpentry',
      desc: 'Service for carpentry',
      locale: locale.toString(),
    );
  }

  String get searchHint {
    return Intl.message(
      'Search for a service...',
      name: 'searchHint',
      desc: 'Hint text for the search bar',
      locale: locale.toString(),
    );
  }

  String get servicesList {
    return Intl.message(
      'Services List',
      name: 'servicesList',
      desc: 'Title for the services list section',
      locale: locale.toString(),
    );
  }

  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: 'Chat screen in drawer',
      locale: locale.toString(),
    );
  }

  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: 'Account screen in drawer',
      locale: locale.toString(),
    );
  }

  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: 'Location access screen in drawer',
      locale: locale.toString(),
    );
  }

  String get orders {
    return Intl.message(
      'Orders',
      name: 'orders',
      desc: 'Orders screen in drawer',
      locale: locale.toString(),
    );
  }

  String get support {
    return Intl.message(
      'Support & Help',
      name: 'support',
      desc: 'Support and help screen in drawer',
      locale: locale.toString(),
    );
  }

  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: 'Settings screen in drawer',
      locale: locale.toString(),
    );
  }

  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: 'Change language option in drawer',
      locale: locale.toString(),
    );
  }

  String get welcome {
    return Intl.message(
      'Home Service ',
      name: 'welcome',
      desc: 'Welcome message on the home screen',
      locale: locale.toString(),
    );
  }

  String get services {
    return Intl.message(
      'Services',
      name: 'services',
      desc: 'Label for services tab',
      locale: locale.toString(),
    );
  }

  String get serviceProviders {
    return Intl.message(
      'Service Providers',
      name: 'serviceProviders',
      desc: 'Label for service providers tab',
      locale: locale.toString(),
    );
  }

  // إضافة المزيد من النصوص هنا حسب الحاجة...
}

// `LocalizationsDelegate` لتوفير الترجمة في التطبيق
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // دعم اللغات المطلوبة (مثال: العربية والإنجليزية)
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    // تحميل الترجمة المناسبة
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
