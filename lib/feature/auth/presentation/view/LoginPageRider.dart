import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ptpay/core/utils/gorouter.dart';
import 'package:ptpay/core/widget/LinearGradien.dart';
import 'package:ptpay/core/widget/logo.dart';
import 'package:ptpay/feature/auth/presentation/view/widget/login_widgets/LoginButtonWidget.dart';
import 'package:ptpay/feature/auth/presentation/view/widget/login_widgets/TextformWidget.dart';

class LoginPageRider extends StatefulWidget {
  const LoginPageRider({super.key});

  @override
  State<LoginPageRider> createState() => _LoginPageRiderState();
}

class _LoginPageRiderState extends State<LoginPageRider> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isDataEntered = false;

  void _checkDataEntered(String phone, String password) {
    setState(() {
      _isDataEntered = phone.isNotEmpty && password.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset:false,
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            const Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Lineargradien(),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  const Logo(),
                  const SizedBox(height: 39.24),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Alexandria',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 37),
                  Column(
                    children: [
                      TextformWidget(
                        phoneController: _phoneController,
                        passwordController: _passwordController,
                        onDataEntered: _checkDataEntered,
                      ),
                      const SizedBox(height: 9),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/forgetPassword');
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(left: 53, right: 53, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'نسيت كلمة المرور؟',
                                style: TextStyle(
                                  color: Color(0xFF979797),
                                  fontSize: 12,
                                  fontFamily: 'Alexandria',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.60,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 171),
                      LoginButtonWidget(
                        isDataEntered: _isDataEntered,
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.KHomepage);
                        },
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              GoRouter.of(context).push(AppRouter.KChooseLocationSecond);
                            },
                            child: const Text(
                              "إنشاء حساب ",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const Text(
                            "ليس لديك حساب ؟ ",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: Color(0xff979797),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 70),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
