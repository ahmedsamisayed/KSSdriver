import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:kss_driver/core/widgets/scaffoldSnackbar.dart';
import 'package:kss_driver/model/api/postForgetPassword/postForgetPasswordResponse.dart';
import 'dart:convert';
import '../appConstants.dart';

ResetPasswordResponse resetResponse = ResetPasswordResponse();


Future PostNewPassword(String newPassword, String confNewPassword, BuildContext context) async {

  final response = await http.put(
    Uri.parse('${AppConstants.generalUrl}/password/reset'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<dynamic, dynamic>{
      'phone': AppConstants.userPhoneForForgetPassword,
      'resetPasswordToken': AppConstants.OTP,
      'password': newPassword,
      'confirmPassword': confNewPassword
    }),
  );
  resetResponse = ResetPasswordResponse.fromJson(jsonDecode(response.body));
  if (response.statusCode == 200) {
    showScaffoldSnackBar('تم تعديل كلمة المرور بنجاح', context);

    Navigator.of(context).pushNamed('Login Screen');
  }
  else {
    showScaffoldSnackBar('${resetResponse.message}', context);
    throw Exception('حدثت مشكلة الرجاء المحاولة مرة اخرى');
  }
}