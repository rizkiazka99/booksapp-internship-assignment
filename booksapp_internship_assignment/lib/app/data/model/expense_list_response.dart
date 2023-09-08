class ExpenseList {
    String expenseName;
    String description;
    dynamic vendorName;
    dynamic notes;
    int cost;
    String category;
    String internalKeyForKnownExpenses;
    String serviceId;

    ExpenseList({
        required this.expenseName,
        required this.description,
        required this.vendorName,
        required this.notes,
        required this.cost,
        required this.category,
        required this.internalKeyForKnownExpenses,
        required this.serviceId,
    });

    factory ExpenseList.fromJson(Map<String, dynamic> json) => ExpenseList(
        expenseName: json["expenseName"],
        description: json["description"],
        vendorName: json["vendorName"],
        notes: json["notes"],
        cost: json["cost"],
        category: json["category"],
        internalKeyForKnownExpenses: json["internalKeyForKnownExpenses"],
        serviceId: json["serviceId"],
    );

    Map<String, dynamic> toJson() => {
        "expenseName": expenseName,
        "description": description,
        "vendorName": vendorName,
        "notes": notes,
        "cost": cost,
        "category": category,
        "internalKeyForKnownExpenses": internalKeyForKnownExpenses,
        "serviceId": serviceId,
    };
}
