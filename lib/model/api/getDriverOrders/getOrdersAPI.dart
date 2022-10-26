import 'package:http/http.dart'as http;
import 'package:kss_driver/model/api/appConstants.dart';
import 'dart:convert';
import 'package:kss_driver/model/api/infos/infoResponseModule.dart';

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
  // else if(response.statusCode == 400) {
  //   //registerResult.result = 'Registration Done successfully';
  //   //return RegisterResponse.fromJson(jsonDecode(response.body));
  //   throw Exception('أدخل رقم المستخدم او الرقم السري');
  // }
  // else if (response.statusCode == 401) {
  //   //registerResult.result = 'Registration Done successfully';
  //   // return RegisterResponse.fromJson(jsonDecode(response.body));
  //   throw Exception('رقم المستخدم او الرقم السري غير صحيح');
  // }
  else {
    throw Exception('حدثت مشكلة الرجاء المحاولة مرة اخرى');
  }
}