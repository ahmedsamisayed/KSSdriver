import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kss_driver/core/widgets/scaffoldSnackbar.dart';
import 'package:kss_driver/model/api/appConstants.dart';

import 'dart:convert';

import '../../../view/user/order/checker.dart';

Future updateOrderStatus(BuildContext context) async {
  //RegisterResult registerResult = RegisterResult();
  //try {
  final response = await http.put(
    Uri.parse('${AppConstants.generalUrl}/admin/order/${AppConstants.currentOrderId}'),
    headers: <String, String>{
      'Cookie': 'token=${AppConstants.userAccessToken}',
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{'orderStatus': "Delivered"}),
  );
  if (response.statusCode == 200) {
    showScaffoldSnackBar('Done', context);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CheckerForOrderScreen()));
  }
  // }
  else {
    showScaffoldSnackBar('حدثت مشكلة الرجاء المحاولة مرة اخرى', context);
    throw Exception('حدثت مشكلة الرجاء المحاولة مرة اخرى');
  }
}
// Future<http.Response> updateUserData(String name, String email) {
//   return http.put(
//     Uri.parse('${AppConstants.generalUrl}/me/update'),
//     headers: <String, String>{
//       'Cookie': 'token=${AppConstants.userAccessToken}',
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'name': name, 'email': email
//     }),
//   );
// }