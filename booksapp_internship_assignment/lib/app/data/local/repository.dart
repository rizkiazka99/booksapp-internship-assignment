import 'package:booksapp_internship_assignment/app/data/model/expense_list_response.dart';
import 'package:booksapp_internship_assignment/app/data/model/login_response.dart';

abstract class LocalRepository {
  Future saveLoginResponse(LoginResponse response);

  Future getStatus();

  Future<List<ExpenseList>> getExpenseList();
}