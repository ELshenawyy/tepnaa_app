import 'package:flutter/material.dart';

abstract class AppLocale {

  static const Locale ar = Locale('ar');
  static const Locale en = Locale('en');

  static const List<Locale> supportedLocales = [ar, en];

  static const String path = 'assets/translations';
}