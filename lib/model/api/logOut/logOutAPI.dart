import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:kss_driver/core/widgets/scaffoldSnackbar.dart';
import 'dart:convert';

import '../appConstants.dart';
import 'logOutModule.dart';



Future<LogOutResponse> logOutDriver(BuildContext context) async {
  final response = await http.get(
    Uri.parse('${AppConstants.generalUrl}/logout'),
    headers: <String, String>{
      'Cookie': 'token=${AppConstants.userAccessToken}',
    },
  );
  LogOutResponse logOutResponse = LogOutResponse.fromJson(jsonDecode(response.body));
  if (response.statusCode == 200) {
    showScaffoldSnackBar('تم تسجيل الخروج بنجاح', context);
    Navigator.of(context).pushNamed('Login Screen');
    return logOutResponse;
  }
  else {
    showScaffoldSnackBar('حدثت مشكلة الرجاء المحاولة مرة اخرى', context);
    throw Exception('حدثت مشكلة الرجاء المحاولة مرة اخرى');
  }
}