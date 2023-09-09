import 'package:booksapp_internship_assignment/app/data/local/local_implementation.dart';
import 'package:booksapp_internship_assignment/app/data/model/expense_list_response.dart';
import 'package:booksapp_internship_assignment/app/routes/app_pages.dart';
import 'package:booksapp_internship_assignment/app/utils/colors.dart';
import 'package:booksapp_internship_assignment/app/utils/helpers.dart';
import 'package:booksapp_internship_assignment/app/widgets/confirmation_dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final LocalImplementation _localData = LocalImplementation();

  TextEditingController searchController = TextEditingController();
  final searchFormKey = GlobalKey<FormState>();
  var autoValidateSearch = AutovalidateMode.disabled;

  RxBool _searchInitiated = false.obs;
  RxList<ExpenseList> _expenseList = <ExpenseList>[].obs;
  RxList<ExpenseList> _filteredExpenses = <ExpenseList>[].obs;

  bool get searchInitiated => _searchInitiated.value;
  List<ExpenseList> get expenseList => _expenseList;
  List<ExpenseList> get filteredExpenses => _filteredExpenses;

  set searchInitiated(bool searchInitiated) =>
      this._searchInitiated.value = searchInitiated;
  set expenseList(List<ExpenseList> expenseList) =>
      this._expenseList.value = expenseList;
  set filteredExpenses(List<ExpenseList> filteredExpenses) =>
      this._filteredExpenses.value = filteredExpenses;

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
    searchController.dispose();
    super.onClose();
  }

  Future<List<ExpenseList>> getExpenseList() async {
    List<ExpenseList> res = _localData.getExpenseList();
    expenseList = res;

    return expenseList;
  }

  searchExpense(String query) {
    filteredExpenses = expenseList.where((element) => 
      element.expenseName
        .replaceAll(' ', '')
        .replaceAll(RegExp('[^A-Za-z]'), '')
        .toLowerCase()
        .contains(
          query
            .replaceAll(' ', '')
            .replaceAll(RegExp('[^A-Za-z]'), '')
            .toLowerCase()
        )
    ).toList();
  }

  initiateLogout() {
    Get.dialog(ConfirmationDialog(
      title: 'Hold up!', 
      content: 'Are you sure you want to log out?', 
      onConfirmation: () async {
        loaderDialog(
          const SpinKitRing(color: primaryColor), 
          'Please wait...'
        );
        await _localData.clear()
            .then((value) => 
              Get.offAllNamed(Routes.LOGIN)
            );
      }
    ));
  }

  void handleClick(int item) {
    switch(item) {
      case 0:
        initiateLogout();
        break;
    }
  }
}
