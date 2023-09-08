import 'package:booksapp_internship_assignment/app/data/api/repository.dart';
import 'package:booksapp_internship_assignment/app/data/model/login_response.dart';
import 'package:booksapp_internship_assignment/app/utils/result.dart';
import 'package:booksapp_internship_assignment/app/utils/use_case.dart';


class LoginParams {
  final String email;

  LoginParams({ required this.email });
}

class LoginUseCase extends UseCase<dynamic, LoginParams> {
  final APIRepository api_repository;

  LoginUseCase({ required this.api_repository });

  @override
  Future<Result<LoginResponse>> call(LoginParams params) async {
    if (!await hasInternetConnection) {
      return Result.noInternet();
    } else {
      return api_repository.login(params: params);
    }
  }
}