import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../../../core/const.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../model/api/appConstants.dart';

class OldOrderItem extends StatefulWidget {
  //const ({ Key? key }) : super(key: key);
  final name;
  final OrderNumber;
  final Adress;
  final orderLatitude;
  final orderLongitude;
  var listOfItems;
  OldOrderItem(this.name, this.OrderNumber, this.Adress, this.orderLatitude, this.orderLongitude, this.listOfItems);

  @override
  State<OldOrderItem> createState() => _OldOrderItemState();
}

class _OldOrderItemState extends State<OldOrderItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        AppConstants.currentPositionLatitude = widget.orderLatitude;
        AppConstants.currentPositionLongitude = widget.orderLongitude;
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
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                          SizedBox(
                            height: 90,
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
                            text: widget.name,
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          SizedBox(
                            height: 11,
                          ),
                          CustomText(
                            text: widget.OrderNumber,
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          SizedBox(
                            height: 11,
                          ),
                          CustomText(
                            text: widget.Adress,
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          SizedBox(
                            height: 11,
                          ),
                          //Text('a'),
                             Container(
                               height: 105,
                               width: MediaQuery.of(context).size.width / 2,
                               child: ListView.builder(
                                  itemCount: widget.listOfItems.length,
                                  itemBuilder: (context, i) {
                                    return Text("${widget.listOfItems[i].name}،الكمية :${widget.listOfItems[i].quantity}،${widget.listOfItems[i].head}،${widget.listOfItems[i].bowels}،${widget.listOfItems[i].weight}");
                                    //   Column(
                                    //   children: [
                                    //     CustomText(
                                    //       //text: "${widget.listOfItems[i].name},،الكمية :${widget.listOfItems[i].quantity}،${widget.listOfItems[i].head}،${widget.listOfItems[i].bowels}،${widget.listOfItems[i].weight}",
                                    //       text: ",،ال",
                                    //       color: Colors.black,
                                    //       fontSize: 15,
                                    //     ),
                                    //     SizedBox(
                                    //       height: 5,
                                    //     ),
                                    //   ],
                                    // );

                            }),
                             ),


                          // CustomText(
                          //   text: 'fddf',
                          //   color: Colors.black,
                          //   fontSize: 15,
                          // ),
                        ],
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }
}
