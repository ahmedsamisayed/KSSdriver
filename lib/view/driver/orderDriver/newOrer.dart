import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:kss_driver/model/api/appConstants.dart';

import '../../../core/const.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/widgets/custom_text.dart';

class NewOrderItem extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);
  final name;
  final OrderNumber;
  final orderLatitude;
  final orderLongitude;
  final orderOwnerNumber;
  final orderOwnerNumber2;
  final orderId;
  NewOrderItem(this.name, this.OrderNumber, this.orderLatitude, this.orderLongitude,
      this.orderOwnerNumber,
      this.orderOwnerNumber2,
      this.orderId);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppConstants.currentPositionLatitude = orderLatitude;
        AppConstants.currentPositionLongitude = orderLongitude;
        AppConstants.currentOrderId = orderId;
        Navigator.of(context).pushNamed('DriverMapScreen');
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Primarycolor,
                  width: 2,
                )),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          CustomText(
                            text: "طلب بواسطة :",
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: "رقم الطلب :",
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: name,
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: OrderNumber,
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }
}
