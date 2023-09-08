import 'package:booksapp_internship_assignment/app/data/api/auth/login/login_usecase.dart';
import 'package:booksapp_internship_assignment/app/data/model/login_response.dart';
import 'package:booksapp_internship_assignment/app/utils/result.dart';

abstract class APIRepository {
  Future<Result<LoginResponse>> login({
    required LoginParams params
  });
}