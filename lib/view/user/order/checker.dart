
import 'package:flutter/material.dart';
import 'package:kss_driver/model/api/getOrders/getOrdersAPI.dart';
import 'package:kss_driver/view/user/order/order.dart';

import '../../../model/api/appConstants.dart';
import '../../../model/api/getDriverOrders/getOrdersAPI.dart';
import '../../../model/api/getDriverOrders/getOrdersREsponse.dart';
import '../../../model/api/getOrders/getOrdersResponse.dart';
import '../../../model/api/getOrders/orderModule.dart';
import '../../../model/api/getSingleOrder/getSingleOrderAPI.dart';
import '../../../model/api/getSingleOrder/getSingleOrderResponse.dart';
import '../../driver/orderDriver/orderDriver.dart';

class CheckerForOrderScreen extends StatefulWidget {
   CheckerForOrderScreen({Key? key}) : super(key: key);

  @override
  State<CheckerForOrderScreen> createState() => _CheckerForOrderScreenState();
}

class _CheckerForOrderScreenState extends State<CheckerForOrderScreen> {
  Future<GetDeliveries> getOrdersResult = getDriverOrders();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: buildGetOrdersFutureBuilder()
      ),
    );}

   FutureBuilder<GetDeliveries> buildGetOrdersFutureBuilder() {
    var b = [];
    var a = [];
     return FutureBuilder<GetDeliveries>(
         future: getOrdersResult,
         builder: (context, snapshot) {
           if (snapshot.hasData) {


             WidgetsBinding.instance.addPostFrameCallback((_) {
               a.clear();
               AppConstants.driverOrders.clear();
               if (snapshot.data!.deliveries == null)
                 {
                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderDriverScreen(
                     ///pass value
                       OrdersList: AppConstants.driverOrders

                   )));
                 }
               else {
                 snapshot.data!.deliveries!.forEach((n) {
                   a.add(n.order.toString());
                 });
                 getOrderById(a, context);
               }
             }
             );
             return CircularProgressIndicator();
           }
           else if (snapshot.hasError) {
             return Text('${snapshot.error}', style: TextStyle(color: Colors.black), );
           }
           return CircularProgressIndicator();
         }
     );
   }
}
