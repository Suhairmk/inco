import 'package:flutter/material.dart';
import 'package:inco/core/constent/colors.dart';
import 'package:inco/core/utlities/validations.dart';
import 'package:inco/core/widgets/customeButton.dart';
import 'package:inco/core/widgets/customeTextfield.dart';
import 'package:inco/presentation/views/auth/otpScreen.dart';
import 'package:inco/presentation/views/auth/registerScreen.dart';
import 'package:inco/state/profileProvider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  TextEditingController phoneController = TextEditingController();

  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var mediaqry = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Forgot Password',
                style: TextStyle(
                    color: appThemeColor,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: mediaqry.height * 0.08,
              ),
              CustomeTextfield(
                pretext: '+91 ',
                keybordType: TextInputType.number,
                prifixicon: Icons.phone,
                label: 'enter phone',
                controller: phoneController,
                validator: (value) {
                  if (value.toString().length != 10) {
                    return 'invalid Phone number';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: mediaqry.height * 0.05,
              ),
              CustomeButton(
                  ontap: () async {
                    if (formkey.currentState!.validate()) {
                      bool isSend = await auth.sendOtpToMobile(
                          phoneController.text, context);
                      // if (isSend) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctxtt) => OTPScreen(
                              isReg: false,
                              phone: phoneController.text,
                            ),
                          ));
                      // }

                      print('object');
                    }
                  },
                  height: 43,
                  width: mediaqry.width / 2,
                  text: 'send OTP'),
              SizedBox(
                height: mediaqry.height * 0.05,
              ),
            ],
          ),
        ),
      )),
    );
  }
}