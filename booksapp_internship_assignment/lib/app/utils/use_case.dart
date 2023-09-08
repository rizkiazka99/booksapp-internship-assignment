import 'package:booksapp_internship_assignment/app/utils/result.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

abstract class UseCase<Type, Params> {
  Future<bool> get hasInternetConnection async => 
      await Connectivity().checkConnectivity() != ConnectivityResult.none;

  Future<Result<Type>> call(Params params);
}