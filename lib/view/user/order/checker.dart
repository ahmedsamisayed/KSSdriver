
import 'package:flutter/material.dart';
import 'package:kss_driver/model/api/getOrders/getOrdersAPI.dart';
import 'package:kss_driver/view/user/order/order.dart';

import '../../../model/api/appConstants.dart';
import '../../../model/api/getDriverOrders/getOrdersAPI.dart';
import '../../../model/api/getDriverOrders/getOrdersREsponse.dart';
import '../../../model/api/getOrders/getOrdersResponse.dart';
import '../../../model/api/getOrders/orderModule.dart';
import '../../../model/api/getSingleOrder/getSingleOrderAPI.dart';
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
     return FutureBuilder<GetDeliveries>(
         future: getOrdersResult,
         builder: (context, snapshot) {
           if (snapshot.hasData) {
             WidgetsBinding.instance.addPostFrameCallback((_) {

               AppConstants.driverDeliveries = snapshot.data!.deliveries;
               var ordersResponse;
               var orders;
               //onProcessingOrders.clear();
               //completedOrders.clear();
               AppConstants.driverDeliveries!.forEach((n) => {
                 ordersResponse!.add(getSingleOrder(n.order)),
               });
               ordersResponse!.forEach((element) {
                 orders.add(ordersResponse.order);
               });

               Navigator.of(context).push( MaterialPageRoute(
                   builder: (context) => OrderDriverScreen(
                     ///pass value
                     OrdersList: orders

                   )));
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
