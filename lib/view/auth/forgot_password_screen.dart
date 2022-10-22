import 'package:flutter/material.dart';
import 'package:kss_driver/core/utils/size_config.dart';
import 'package:kss_driver/core/widgets/scaffoldSnackbar.dart';

import '../../core/widgets/custom_Text_field_phone.dart';
import '../../core/widgets/custom_buttom.dart';
import '../../model/api/forgetPassword/forgetApi.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController phone = new TextEditingController();

  GlobalKey<FormState> formStateforgotPassword = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Form(
              key: formStateforgotPassword,
              child: ListView(children: [
                Container(
                  height: SizeConfig.screenheight! / 2.5,
                  child: Image.asset("lib/assets/images/forgot-password.jpg"),
                ),
                SizedBox(height: SizeConfig.screenheight! * .15),
                CustomTextFieldPhone(
                  myController: phone,
                ),
                SizedBox(height: SizeConfig.screenheight! * .1),
                CustomMaterialButtom(
                    text: "إرسال",
                    press: () {
                      if(phone.text.isNotEmpty) {
                        //Navigator.of(context).pushNamed('OTP Screen');

                        ForgetPassword(phone.text,context);
                      }else{
                        showScaffoldSnackBar('الرقم غير صحيح', context);
                      }
                      // Navigator.of(context).pushNamed('OTP Screen');
                    }),
              ]),
            ),
          ),
        ));
  }

}
