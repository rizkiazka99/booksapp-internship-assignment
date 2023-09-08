import 'package:booksapp_internship_assignment/app/data/api/auth/login/login_usecase.dart';
import 'package:booksapp_internship_assignment/app/data/api/repository.dart';
import 'package:booksapp_internship_assignment/app/data/local/local_implementation.dart';
import 'package:booksapp_internship_assignment/app/data/model/login_response.dart';
import 'package:booksapp_internship_assignment/app/utils/constants.dart';
import 'package:booksapp_internship_assignment/app/utils/dio.dart';
import 'package:booksapp_internship_assignment/app/utils/result.dart';
import 'package:dio/dio.dart';

class LoginImplementation extends APIRepository {
  final _dio = DioHelper.init();
  final LocalImplementation _localData = LocalImplementation();

  @override
  Future<Result<LoginResponse>> login({
    required LoginParams params
  }) async {
    const endpoint = baseUrl + '/doLogin';
    final data = {
      'email': params.email
    };

    try {
      final response = await _dio.post(
        endpoint,
        data: data
      );

      final result = LoginResponse.fromJson(response.data);
      await _localData.saveLoginResponse(result);
      return Result.success(result);
    } on DioException catch(err) {
      return Result.error(
        message: err.response!.data['err'] ?? err.message,
        code: err.response!.statusCode ?? 400
      );
    } catch(err) {
      return Result.error(
        message: err.toString()
      );
    }
  }
}