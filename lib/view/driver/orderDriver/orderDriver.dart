import 'dart:async';
import 'dart:io';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../../../../core/const.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../model/api/logOut/logOutAPI.dart';
import '../../user/order/checker.dart';
import 'OldOreder.dart';
import 'newOrer.dart';

class OrderDriverScreen extends StatefulWidget {
  @override
  _OrderDriverScreenState createState() => _OrderDriverScreenState();
  var OrdersList;
  OrderDriverScreen({
    this.OrdersList
});

}
var onProcessingOrders = [];
var completedOrders = [];


class _OrderDriverScreenState extends State<OrderDriverScreen> {
  SplitOrders () {
    List list = widget.OrdersList;
    onProcessingOrders.clear();
    completedOrders.clear();
    list.forEach((n) => {
      if (n.orderStatus == "Processing") {
        onProcessingOrders.add(n)
      }
      else if (n.orderStatus == "Delivered") {
        completedOrders.add(n)
      }
    });}
  Timer? timer;
  @override
  void initState() {
    // TODO: implement initState
    //timer = Timer.periodic(Duration(seconds: 10), (Timer t) => Navigator.of(context).push(MaterialPageRoute(builder: (context) => CheckerForOrderScreen())));

    SplitOrders();
    super.initState();
  }

  @override
  void dispose() {
    //timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) =>
      WillPopScope(
          onWillPop: () async {
            final shouldPop = await showDialog<bool>(
              context: context,
              builder: (context) {
                return exit(0);
              },
            );
            return shouldPop!;
          },
          child:
      DefaultTabController(
        length: 2,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: CustomText(
                text: "?????????? ??????????????",
                alignment: Alignment.center,
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap: (){
                      showAlertDialog(context);
                      },
                      child: Icon(Icons.logout, color: Colors.black,)),
                ),
              ],
            ),
            body: TabBarView(children: [
              Center(
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Column(children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 1.3,
                      child: onProcessingOrders.length == 0
                          ? Center(
                          child: Text(
                            '???? ???????? ?????????? ??????????',
                            style: TextStyle(
                              fontFamily: "Tajawal",
                              fontSize: 20,
                            ),
                          ))
                          :
                      ListView.builder(
                          itemCount: onProcessingOrders.length,
                          itemBuilder: (context, i) {
                            return NewOrderItem(onProcessingOrders[i].shippingInfo[0].userName,
                                onProcessingOrders[i].num.toString(),
                                onProcessingOrders[i].shippingInfo[0].location.latitude,
                                onProcessingOrders[i].shippingInfo[0].location.longitude,
                                onProcessingOrders[i].shippingInfo[0].phoneNo1,
                                onProcessingOrders[i].shippingInfo[0].phoneNo2,
                                onProcessingOrders[i].sId,
                                onProcessingOrders[i].shippingInfo[0].address
                            );
                          }),
                    ),
                  ]),
                ),
              ),
              Center(
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 1.6,
                      child: completedOrders.length == 0
                          ? Center(
                          child: Text(
                            '???? ???????? ?????????? ??????????',
                            style: TextStyle(
                              fontFamily: "Tajawal",
                              fontSize: 20,
                            ),
                          ))
                          :
                      ListView.builder(
                          itemCount: completedOrders.length,
                          itemBuilder: (context, i) {
                            return OldOrderItem(
                                completedOrders[i].shippingInfo[0].userName,
                                completedOrders[i].num.toString(),
                                completedOrders[i].shippingInfo[0].address,
                              completedOrders[i].shippingInfo[0].location.latitude,
                              completedOrders[i].shippingInfo[0].location.longitude,
                              completedOrders[i].orderItems);
                          }),
                    ),
                  ]),
                ),
              )
            ]),

            //////////////////NavBar//////////////////////////
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(20),
              child: TabBar(
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(color: Primarycolor, width: 5),
                ),
                unselectedLabelColor: Colors.grey,
                labelColor: Primarycolor,
                tabs: [
                  Tab(
                      child: Padding(
                    padding: EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.article_outlined),
                            Text(
                              "?????????? ??????????",
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
                  Tab(
                      child: Padding(
                    padding: EdgeInsets.all(0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.article_outlined),
                            Text(
                              "?????????? ???? ??????????????",
                            )
                          ],
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
        ),
      ));
  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("????"),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("??????"),
      onPressed:  () {
        logOutDriver(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("?????????? ???????????? "),
      content: Text("???? ?????? ???????? ?????????? ???????????? ??"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
