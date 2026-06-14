import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_screen/core/localization/app_locate.dart';
import 'package:login_screen/core/router/app_router.dart';
import 'package:login_screen/core/theme/app_theme.dart';
import 'core/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  setupDependencies();

  runApp(
    EasyLocalization(
      supportedLocales: AppLocale.supportedLocales,
      path: AppLocale.path,
      fallbackLocale: AppLocale.ar,
      child: const TibnaApp(),
    ),
  );
}

class TibnaApp extends StatelessWidget {
  const TibnaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Tibna',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
    );
  }
}