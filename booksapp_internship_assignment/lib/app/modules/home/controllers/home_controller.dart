import 'package:booksapp_internship_assignment/app/data/local/local_implementation.dart';
import 'package:booksapp_internship_assignment/app/data/model/expense_list_response.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final LocalImplementation _localData = LocalImplementation();
  List<ExpenseList> expenseList = [];

  @override
  void onInit() {
    super.onInit();
    getExpenseList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<List<ExpenseList>> getExpenseList() async {
    List<ExpenseList> res = await _localData.getExpenseList();
    expenseList = res;
    print(expenseList);
    return expenseList;
  }
}
