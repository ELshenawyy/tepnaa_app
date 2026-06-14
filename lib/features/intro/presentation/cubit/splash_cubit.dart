import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_screen/core/constants/app_constants.dart';
import 'package:login_screen/features/intro/presentation/cubit/splash_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashInitial());

  Future<void> init() async {
    emit(const SplashLoading());
    await Future.delayed(const Duration(seconds: 2));

    final prefs = await SharedPreferences.getInstance();
    final isFirstTime = prefs.getBool(AppConstants.isFirstTimeKey) ?? true;

    if (isFirstTime) {
      await prefs.setBool(AppConstants.isFirstTimeKey, false);
      emit(const SplashNavigateToLanguage());
    } else {
      emit(const SplashNavigateToLogin());
    }
  }
}
