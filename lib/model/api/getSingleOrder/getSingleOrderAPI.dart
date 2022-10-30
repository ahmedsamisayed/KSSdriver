import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:kss_driver/model/api/appConstants.dart';
import 'dart:convert';
import 'package:kss_driver/model/api/infos/infoResponseModule.dart';

import '../../../view/driver/orderDriver/orderDriver.dart';
import 'getSingleOrderResponse.dart';

Future<void> getOrderById (List a, BuildContext context) async{
  AppConstants.driverOrders.clear();
  for(String x in a){
    await getSingleOrder(x);
  };
  Navigator.of(context).push( MaterialPageRoute(
      builder: (context) => OrderDriverScreen(
        ///pass value
          OrdersList: AppConstants.driverOrders

      )));
  // print(AppConstants.driverOrders[0].orderStatus);
  // Navigator.of(context).push( MaterialPageRoute(
  //     builder: (context) => OrderDriverScreen(
  //       ///pass value
  //         OrdersList: b
  //
  //     )));
}


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
    AppConstants.driverOrders.add(getSingleOrder.order);
    return getSingleOrder;
  }
  else {
    throw Exception('حدثت مشكلة الرجاء المحاولة مرة اخرى');
  }
}