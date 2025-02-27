import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ptpay/core/utils/gorouter.dart';
import 'package:ptpay/core/widget/LinearGradien.dart';
import 'package:ptpay/core/widget/logo.dart';
import 'package:ptpay/feature/auth/presentation/view/widget/forgetpassword_widgets/oTPInputField.dart';
import 'package:ptpay/feature/auth/presentation/view/widget/forgetpassword_widgets/oTPNumberPad.dart';
import 'package:ptpay/feature/auth/presentation/view/widget/forgetpassword_widgets/oTPSubmitButton.dart';


class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  final TextEditingController _otpController = TextEditingController();
  String otp = "";

  void _onNumberPressed(String number) {
    if (otp.length < 6) {
      setState(() {
        otp += number;
        _otpController.text = otp;
      });
    }
  }

  void _onDelete() {
    if (otp.isNotEmpty) {
      setState(() {
        otp = otp.substring(0, otp.length - 1);
        _otpController.text = otp;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isFormValid = otp.length == 6;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Lineargradien(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 80),
                const Logo(),
                const SizedBox(height: 27),
                const Text(
                  "سوف يتم إرسال رسالة نصية على رقم هاتفك الخاص\n+2012 XXX-XXXX",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                OTPInputField(otpController: _otpController, otp: otp),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {},
                        child: Text("إعادة إرسال", style: TextStyle(color: Color(0xff979797), fontSize: 15, fontWeight: FontWeight.w400, fontFamily: 'Alexandria'),)),
                    SizedBox(width: 5,),
                    Text("00:30", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400, fontFamily: 'Alexandria'),),
                  ],
                ),
                const SizedBox(height: 20),
                OTPNumberPad(onNumberPressed: _onNumberPressed, onDelete: _onDelete),
                const SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.KConfirmAccountCreation);
                  },
                  child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF090909),
                          Color(0xFF293851),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Center(
                      child: Text(
                        'تم',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Alexandria',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.80,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
