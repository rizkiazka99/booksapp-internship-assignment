import 'package:booksapp_internship_assignment/app/data/local/repository.dart';
import 'package:booksapp_internship_assignment/app/data/model/expense_list_response.dart';
import 'package:booksapp_internship_assignment/app/data/model/login_response.dart';
import 'package:booksapp_internship_assignment/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';

class LocalImplementation extends LocalRepository {
  final LocalStorage _storage = LocalStorage('login_response');

  @override
  Future saveLoginResponse(LoginResponse response) async {
    await _storage.setItem('status', response.status);
    await _storage.setItem('expense_list', response.expenseList);
  }

  @override
  getStatus() {
    final status = _storage.getItem('status');
    return status;
  }

  @override
  List<ExpenseList> getExpenseList() {
    if (Get.previousRoute == Routes.SPLASH) {
      List<ExpenseList> expenses = [];
      List res = _storage.getItem('expense_list');
   
      if (res.isNotEmpty) {
        expenses = res.map((element) { 
          return ExpenseList(
            expenseName: element['expenseName'], 
            description: element['description'], 
            vendorName: element['vendorName'], 
            notes: element['notes'], 
            cost: element['cost'], 
            category: element['category'], 
            internalKeyForKnownExpenses: element['internalKeyForKnownExpenses'], 
            serviceId: element['serviceId']
          );
        }).toList();
      }

      return expenses;
    } else {
      List<ExpenseList> expenses = _storage.getItem('expense_list');
      return expenses;
    }
    
  }

  @override
  Future clear() async {
    await _storage.clear();
  }
}