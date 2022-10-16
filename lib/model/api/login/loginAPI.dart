import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:kss_driver/core/widgets/scaffoldSnackbar.dart';
import 'dart:convert';

import 'package:kss_driver/model/api/login/loginResponseModule.dart';

import '../appConstants.dart';



Future<LoginResponse> loginDriver(String phone,String password, BuildContext context) async {
  LoginResponse loginResponse = LoginResponse();
  final response = await http.post(
    Uri.parse('${AppConstants.generalUrl}/login'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<dynamic, dynamic>{
      'phone': phone,
      'password': password
    }),
  );
  loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
  if (response.statusCode == 200) {
    //registerResult.result = 'Registration Done successfully';
    AppConstants.userAccessToken = loginResponse.token;
    AppConstants.userId = loginResponse.user!.sId;
    AppConstants.userPhone = loginResponse.user!.phone;
    AppConstants.userName = loginResponse.user!.name;
    AppConstants.userEmail = loginResponse.user!.email;
    showScaffoldSnackBar('تم تسجيل الدخول بنجاح', context);

    Navigator.of(context).pushNamed('order driver Screen');
    return loginResponse;
  }
  else if(response.statusCode == 400) {
    showScaffoldSnackBar('أدخل رقم المستخدم او الرقم السري', context);
    return loginResponse;
  }
  else if (response.statusCode == 401) {
    showScaffoldSnackBar('رقم المستخدم او الرقم السري غير صحيح', context);
    return loginResponse;
  }
  else {
    showScaffoldSnackBar('حدثت مشكلة الرجاء المحاولة مرة اخرى', context);
    return loginResponse;

  }
}