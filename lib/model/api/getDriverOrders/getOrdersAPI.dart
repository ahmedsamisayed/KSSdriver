import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:kss_driver/model/api/appConstants.dart';
import 'dart:convert';
import 'package:kss_driver/model/api/infos/infoResponseModule.dart';

import '../../../view/user/order/checker.dart';
import 'getOrdersREsponse.dart';



Future<GetDeliveries> getDriverOrders() async {
  //RegisterResult registerResult = RegisterResult();
  //try {
  final response = await http.get(
    Uri.parse('${AppConstants.generalUrl}/deliveries/me'),
    headers: <String, String>{
      'Cookie': 'token=${AppConstants.userAccessToken}',
    },
    // ),
  );
  GetDeliveries getDeliveries = GetDeliveries.fromJson(jsonDecode(response.body));
  if (response.statusCode == 200) {
    //registerResult.result = 'Registration Done successfully';

    return getDeliveries;
  }
  else {
    throw Exception('حدثت مشكلة الرجاء المحاولة مرة اخرى');
  }
}