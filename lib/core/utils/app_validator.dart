import 'package:easy_localization/easy_localization.dart';
import 'package:login_screen/core/localization/translation_keys.dart';

abstract class AppValidators {


  // ── Email ──────────────────────────────────
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return TKeys.emailRequired.tr();
    }
    if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return TKeys.emailInvalid.tr();
    }
    return null;
  }

  // ── Password ───────────────────────────────
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return TKeys.passwordRequired.tr();
    }
    if (value.length < 6) {
      return TKeys.passwordShort.tr();
    }
    return null;
  }

  // ── Phone ──────────────────────────────────
  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return TKeys.phoneRequired.tr();
    }
    if (value.length < 9) {
      return TKeys.phoneInvalid.tr();
    }
    return null;
  }

  // ── Required ───────────────────────────────
  static String? required(String? value, String message) {
    if (value == null || value.isEmpty) {
      return message;
    }
    return null;
  }
}