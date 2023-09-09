import 'package:booksapp_internship_assignment/app/data/model/expense_list_response.dart';
import 'package:booksapp_internship_assignment/app/utils/colors.dart';
import 'package:booksapp_internship_assignment/app/utils/extensions.dart';
import 'package:booksapp_internship_assignment/app/utils/font_sizes.dart';
import 'package:flutter/material.dart';

Widget expenseCard(BuildContext context, List<ExpenseList> expenseList, int index) {
  return Container(
    height: 200.h,
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
    margin: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 8.h),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: contextGrey.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 7,
              offset: const Offset(0, 3))
        ]),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            expenseList[index].expenseName,
            style: h4(color: primaryColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Flexible(
          child: Text(
            expenseList[index].description,
            style: bodyMd(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(height: 8.h),
        const Divider(
          color: primaryColor,
          height: 4,
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'Cost',
                  style: h5(color: primaryColor),
                ),
                Text(
                  '₹ ${expenseList[index].cost}',
                  style: bodyMd(),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  'Category',
                  style: h5(color: primaryColor),
                ),
                Text(
                  expenseList[index].category,
                  style: bodyMd(),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  'Vendor',
                  style: h5(color: primaryColor),
                ),
                Text(
                  expenseList[index].vendorName ?? 'N/A',
                  style: bodyMd(),
                )
              ],
            )
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                'Service ID',
                style: h5(color: primaryColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Flexible(
              child: Text(
                expenseList[index].serviceId,
                style: bodyMd(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                'Notes',
                style: h5(color: primaryColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Flexible(
              child: Text(
                expenseList[index].notes ?? 'N/A',
                style: bodyMd(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        )
      ],
    ),
  );
}
