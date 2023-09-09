import 'package:booksapp_internship_assignment/app/data/model/expense_list_response.dart';
import 'package:booksapp_internship_assignment/app/data/model/login_response.dart';

abstract class LocalRepository {
  Future saveLoginResponse(LoginResponse response);

  getStatus();

  List<ExpenseList> getExpenseList();

  Future clear();
}