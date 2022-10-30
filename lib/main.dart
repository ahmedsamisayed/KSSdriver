import 'package:flutter/material.dart';

import 'package:kss_driver/view/auth/OTP/OTP_Screen.dart';
import 'package:kss_driver/view/auth/forgot_password_screen.dart';
import 'package:kss_driver/view/auth/login_screen.dart';
import 'package:kss_driver/view/auth/new_password_screen.dart';
import 'package:kss_driver/view/driver/driveMapCompleted.dart';

import 'package:kss_driver/view/driver/driverMap.dart';
import 'package:kss_driver/view/driver/orderDriver/orderDriver.dart';
import 'package:kss_driver/view/onbording/onbording.dart';
import 'package:kss_driver/view/onbording/splashView.dart';

//import 'pacage:kss_driver/view/user/current_location_screen.dart';

void main() {
  // ignore: prefer_const_constructors
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Tajawal"),
      home: Scaffold(
          body: // OrderInformationScreen()
              SplashScreen()

          //OrderDriverScreen()
          ),
      routes: {
        // 'onbording': (context) {
        //   return Onbording();
        //},
        'Login Screen': (context) {
          return LoginScreen();
        },

        'Forgot Password Screen': (context) {
          return ForgotPasswordScreen();
        },
        'OTP Screen': ((context) {
          return OTPScreen();
        }),
        'New Pass Screen': ((context) {
          return NewPassScreen();
        }),
        ////////////////////////driver
        'order driver Screen': (context) {
          return OrderDriverScreen();
        },
        'DriverMapScreen': (context) {
          return DriverMapScreen();
        },
        'Driver Map Screen Completed': (context) {
          return DriverMapScreenCompleted();
        }
      },
    );
  }
}
