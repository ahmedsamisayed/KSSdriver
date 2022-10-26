import 'package:http/http.dart'as http;
import 'package:kss_driver/model/api/appConstants.dart';
import 'dart:convert';
import 'package:kss_driver/model/api/infos/infoResponseModule.dart';

import 'getSingleOrderResponse.dart';



Future<GetSingleOrder> getSingleOrder(String Id) async {
  //RegisterResult registerResult = RegisterResult();
  //try {
  final response = await http.get(
    Uri.parse('${AppConstants.generalUrl}/order/${Id}'),
    headers: <String, String>{
      'Cookie': 'token=${AppConstants.userAccessToken}',
    },
    // ),
  );
   GetSingleOrder getSingleOrder = GetSingleOrder.fromJson(jsonDecode(response.body));
  if (response.statusCode == 200) {
    //registerResult.result = 'Registration Done successfully';
    return getSingleOrder;
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