import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_screen/features/auth/domain/usecases/sign_in_usecase.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final SignInUseCase signInUseCase;

  LoginCubit({required this.signInUseCase}) : super(const LoginInitial());

  Future<void> submit({
    required String email,
    required String password,
  }) async {
    // prevent double tap
    if (state is LoginLoading) return;

    emit(const LoginLoading());

    final result = await signInUseCase(email: email, password: password);

    result.fold(
      (failure) => emit(LoginFailure(failure.message)),
      (user) => emit(LoginSuccess(user)),
    );
  }
}