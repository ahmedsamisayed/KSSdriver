// ignore_for_file: prefer_const_constructors, duplicate_ignore

//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:kss_driver/core/widgets/scaffoldSnackbar.dart';
import 'package:kss_driver/model/api/appConstants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/const.dart';
import '../../core/widgets/custom_buttom.dart';
import '../../core/widgets/custom_listTile.dart';
import '../../model/api/updateUserData/udpateUserDataAPI.dart';

// ignore: non_constant_identifier_names
Widget Details(String name, String Adress, BuildContext context) {
  return Positioned(
    bottom: 0,
    left: 2,
    right: 2,
    child: Container(
        width: double.infinity,
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
          color: Colors.white,
          // ignore: prefer_const_constructors
          borderRadius: BorderRadius.only(
            // ignore: prefer_const_constructors
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Stack(children: [
          // ignore: prefer_const_constructors
          Padding(
            // ignore: prefer_const_constructors
            padding: EdgeInsets.symmetric(
              horizontal: 28,
            ),
            // ignore: prefer_const_constructors
            child: IntrinsicWidth(
              child: VerticalDivider(
                color: Colors.grey,
                indent: 28,
                endIndent: 120,
                thickness: 1,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(children: [
                  CustomListTile(
                    text: "الاسم",
                    subtitel: name,
                    icon: Icons.person,
                  ),
                  CustomListTile(
                    text: "العنوان",
                    subtitel: Adress,
                    icon: Icons.place,
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  CustomMaterialButtom(
                    press: () {
                      updateOrderStatus(context);
                      //    Navigator.of(context)
                      //      .pushNamed('Payment');
                    },
                    text: "تمت عملية التوصيل ",
                  )
                ]),
              )
            ],
          ),
          Positioned(
            top: 10,
            left: 10,
            child: FloatingActionButton(
                heroTag: "btn2",
              onPressed: () {
                showAlertDialog(context);
              },
              backgroundColor: Colors.white,
              child: Icon(
                Icons.phone_forwarded_sharp,
                color: Primarycolor,
              ),
            ),
          ),
        ])),
  );
}
showAlertDialog(BuildContext context) {

  // set up the buttons
  // Widget callFirstNumber = TextButton(
  //   child: Text("لا"),
  //   onPressed:  () {
  //
  //   },
  // );
  // Widget callSecondNumber = TextButton(
  //   child: Text("نعم"),
  //   onPressed:  () {
  //   },
  // );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("الأتصال بصاحب الطلب"),
    content: Center(
      child: Container(
        height: 100,
        child: Column(
          children: [
            TextButton(onPressed: () async {
              if (await canLaunchUrl(Uri.parse('tel:${AppConstants.currentOrderOwnerNumber1}'))) {
                launchUrl(Uri.parse('tel:${AppConstants.currentOrderOwnerNumber1}'));
              } else {
                showScaffoldSnackBar('can_not_launch ${AppConstants.currentOrderOwnerNumber1}', context);

                //showCustomSnackBar('${'can_not_launch'.tr} ${Get.find<SplashController>().configModel.phone}');
              }
            }, child: Text('${AppConstants.currentOrderOwnerNumber1}')),
            SizedBox(height: 2,),
            TextButton(onPressed: () async {
              if (await canLaunchUrl(Uri.parse('tel:${AppConstants.currentOrderOwnerNumber2}'))) {
                launchUrl(Uri.parse('tel:${AppConstants.currentOrderOwnerNumber2}'));
              } else {
                showScaffoldSnackBar('can_not_launch ${AppConstants.currentOrderOwnerNumber2}', context);

                //showCustomSnackBar('${'can_not_launch'.tr} ${Get.find<SplashController>().configModel.phone}');
              }
            }, child: Text('${AppConstants.currentOrderOwnerNumber2}')),
          ],
        ),
      ),
    ),

  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
