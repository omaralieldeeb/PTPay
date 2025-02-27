import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ptpay/core/utils/gorouter.dart';
import 'package:ptpay/core/widget/LinearGradien.dart';
import 'package:ptpay/core/widget/logo.dart';

class ConfirmCreationNewPassword extends StatelessWidget {
  const ConfirmCreationNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
          ),
          const Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Lineargradien(),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const SizedBox(height: 70),
                  const Logo(),
                  const SizedBox(height: 85),
                  const Text(
                    "تم تغيير كلمة المرور بنجاح",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontFamily: 'Alexandria',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 38),
                  const Text("يمكنك الآن تسجيل الدخول باستخدام كلمة المرور الجديدة",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Alexandria',
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 79),
                  Container(
                    width: 75.52,
                    height: 107.99,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/iconkey.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(height: 165),
                  InkWell(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.KChooseLocationFirst);
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
                          'متابعة',
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
