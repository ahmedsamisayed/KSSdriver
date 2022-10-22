import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:kss_driver/core/widgets/scaffoldSnackbar.dart';
import 'dart:convert';
import '../appConstants.dart';


Future PostOTP(String OTP, BuildContext context) async {

  final response = await http.post(
    Uri.parse('${AppConstants.generalUrl}/password/otp'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<dynamic, dynamic>{
      'phone': AppConstants.userPhoneForForgetPassword,
      'resetPasswordToken': OTP
    }),
  );
  if (response.statusCode == 200) {
    AppConstants.OTP = OTP;
    Navigator.of(context).pushNamed('New Pass Screen');
  }
  else {
    showScaffoldSnackBar('الاربع ارقام غير صحيحة', context);
    throw Exception('حدثت مشكلة الرجاء المحاولة مرة اخرى');
  }
}