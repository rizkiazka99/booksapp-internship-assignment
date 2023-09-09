import 'package:booksapp_internship_assignment/app/utils/extensions.dart';
import 'package:booksapp_internship_assignment/app/utils/font_sizes.dart';
import 'package:booksapp_internship_assignment/app/widgets/custom_form.dart';
import 'package:booksapp_internship_assignment/app/widgets/empty_data_state.dart';
import 'package:booksapp_internship_assignment/app/widgets/expense_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  PreferredSizeWidget appBar() {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      title: const Text('Hello there!'),
      actions: [
        PopupMenuButton<int>(
          surfaceTintColor: Colors.white,
          onSelected: (item) => controller.handleClick(item),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 0,
              child: Row(
                children: [
                  const Icon(
                    Icons.logout
                  ),
                  SizedBox(width: 15.w),
                  Text(
                    'Logout',
                    style: h5(fontWeight: FontWeight.normal),
                  )
                ],
              )
            )
          ]
        )
      ],
    );
  }

  Widget search() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 0),
      child: CustomForm(
          formKey: controller.searchFormKey,
          autovalidateMode: controller.autoValidateSearch,
          controller: controller.searchController,
          hintText: 'Search',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: Obx(() => controller.searchInitiated
              ? IconButton(
                  onPressed: () {
                    controller.searchController.clear();
                    controller.searchInitiated = false;
                  },
                  icon: const Icon(Icons.clear)
              )
              : const SizedBox.shrink()),
          onChanged: (query) {
            if (controller.searchController.text.isNotEmpty) {
              controller.searchInitiated = true;
            } else {
              controller.searchInitiated = false;
            }

            controller.searchExpense(query);
          },
          validator: (value) {}),
    );
  }

  Widget expenses(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Obx(() {
          if (controller.expenseList.isEmpty) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 16.h
              ),
              alignment: Alignment.center,
              child: const EmptyDataState(
                message: 'No expense found'
              ),
            );
          } else if (controller.searchInitiated && controller.filteredExpenses.isEmpty) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 16.h
              ),
              alignment: Alignment.center,
              child: EmptyDataState(
                message: 'Expense with the name "${controller.searchController.text}" cannot be found'
              ),
            );
          } else {
            return Column(
              children: List.generate(
                !controller.searchInitiated
                    ? controller.expenseList.length
                    : controller.filteredExpenses.length,
                (index) => expenseCard(
                  context,
                  !controller.searchInitiated
                      ? controller.expenseList
                      : controller.filteredExpenses,
                    index
                )
              ),
            );
          }
        }
        ),
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            search(),
            expenses(context)
          ],
        ),
      ),
    );
  }
}
