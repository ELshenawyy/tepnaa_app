import 'package:dartz/dartz.dart';
import 'package:login_screen/core/errors/failures.dart';
import 'package:login_screen/features/auth/domain/repo/auth_repository.dart';
import '../entities/user_entity.dart';

class SignInUseCase {
  final AuthRepository repository;

  const SignInUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call({
    required String email,
    required String password,
  }) {
    return repository.signIn(email: email, password: password);
  }
}