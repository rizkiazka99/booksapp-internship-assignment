import 'package:booksapp_internship_assignment/app/data/model/expense_list_response.dart';

class LoginResponse {
    int status;
    List<ExpenseList> expenseList;

    LoginResponse({
        required this.status,
        required this.expenseList,
    });

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        status: json["status"],
        expenseList: List<ExpenseList>.from(json["expenseList"].map((x) => ExpenseList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "expenseList": List<dynamic>.from(expenseList.map((x) => x.toJson())),
    };
}
