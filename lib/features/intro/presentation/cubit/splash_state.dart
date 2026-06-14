import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object?> get props => [];
}

class SplashInitial extends SplashState {
  const SplashInitial();
}

class SplashLoading extends SplashState {
  const SplashLoading();
}

class SplashNavigateToLanguage extends SplashState {
  const SplashNavigateToLanguage();
}

class SplashNavigateToLogin extends SplashState {
  const SplashNavigateToLogin();
}