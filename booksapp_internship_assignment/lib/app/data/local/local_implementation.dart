import 'dart:convert';

import 'package:booksapp_internship_assignment/app/data/local/repository.dart';
import 'package:booksapp_internship_assignment/app/data/model/expense_list_response.dart';
import 'package:booksapp_internship_assignment/app/data/model/login_response.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalImplementation extends LocalRepository {
  @override
  Future saveLoginResponse(LoginResponse response) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("status", response.status);
    prefs.setString(
      "expense_list", 
      jsonEncode(response.expenseList)
    );
  }

  @override
  Future getStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final status = prefs.getInt("status");
    return status;
  }

  @override
  Future <List<ExpenseList>> getExpenseList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final rawExpenseList = prefs.getString("expense_list");
    final decodedExpenseList = jsonDecode(rawExpenseList!);
    print(decodedExpenseList);
    List<ExpenseList>  expenseList = (decodedExpenseList as List).map((e) => ExpenseList.fromJson(e)).toList();
    //print(expenseList);
    return expenseList;
  }
}