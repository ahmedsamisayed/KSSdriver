import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../../../core/const.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../model/api/appConstants.dart';

class OldOrderItem extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);
  final name;
  final OrderNumber;
  final Adress;
  final orderLatitude;
  final orderLongitude;
  OldOrderItem(this.name, this.OrderNumber, this.Adress, this.orderLatitude, this.orderLongitude);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        AppConstants.currentPositionLatitude = orderLatitude;
        AppConstants.currentPositionLongitude = orderLongitude;
        Navigator.of(context).pushNamed('Driver Map Screen Completed');
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey,
                  width: 2,
                )),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: "العنوان :",
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: "التفاصيل :",
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
                            height: 11,
                          ),
                          CustomText(
                            text: OrderNumber,
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          SizedBox(
                            height: 11,
                          ),
                          CustomText(
                            text: Adress,
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          SizedBox(
                            height: 11,
                          ),
                          CustomText(
                            text: 'fddf',
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
