import 'package:dio/dio.dart';
import 'package:login_screen/core/errors/exeptions.dart';
import 'package:login_screen/core/network/api_client.dart';

import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signIn({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;

  const AuthRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiClient.dio.post(
        '/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      return UserModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}