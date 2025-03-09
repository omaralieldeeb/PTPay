import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ptpay/core/utils/api_service1.dart';
import 'package:ptpay/core/utils/gorouter.dart';
import 'package:ptpay/core/widget/LinearGradien.dart';
import 'package:ptpay/core/widget/logo.dart';
import 'package:ptpay/feature/auth/presentation/view/widget/login_widgets/LoginButtonWidget.dart';
import 'package:ptpay/feature/auth/presentation/view/widget/login_widgets/TextformWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  final ApiService _apiService = ApiService(Dio());
  Future<void> _handleLogin() async {
    final phone = _phoneController.text;
    final password = _passwordController.text;
    if (phone.isEmpty || password.isEmpty) {
      return;
    }

    try {
      final response = await Dio().post(
        "https://cors-anywhere.herokuapp.com/https://ahmed808.pythonanywhere.com/api/jwt/create/",
        data: {
          'email': phone,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('access_token', response.data["access"]);
        await prefs.setString('refresh_token', response.data["refresh"]);

        GoRouter.of(context).push(AppRouter.KHomepage);
      } else {
        print("فشل تسجيل الدخول، تحقق من بياناتك.");
      }
    } catch (e) {
      print("حدث خطأ أثناء تسجيل الدخول: $e");
    }
  }


  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                          GoRouter.of(context).push(AppRouter.KForgetpassword);
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
                        onTap: _handleLogin,
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
