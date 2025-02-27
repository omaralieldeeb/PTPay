import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ptpay/core/utils/gorouter.dart';
import 'package:ptpay/core/widget/LinearGradien.dart';

class StartLoginPage extends StatelessWidget {
  const StartLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset:false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              const Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Lineargradien(),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'PT',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 34,
                          fontFamily: 'Spantaran',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: [
                              const Color(0xFFF4D800).withOpacity(0.8),
                              const Color(0xFFFF6A00).withOpacity(0.8),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(bounds);
                        },
                        child: const Text(
                          'Pay',
                          style: TextStyle(
                            fontSize: 34,
                            fontFamily: 'Spantaran',
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Text(
                        ' مرحبا بك في',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 34,
                          fontFamily: 'Alexandria',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 66),
                  const Text(
                    '.ابدأ رحلتك مع الدفع السهل والسريع',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Alexandria',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 37.0),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            GoRouter.of(context).push(AppRouter.KChooseLocationFirst);
                          },
                          child: SizedBox(
                            width: 300,
                            height: 50,
                            child: Center(
                              child: Container(
                                width: 300,
                                height: 50,
                                decoration: BoxDecoration(
                                  gradient:const LinearGradient(
                                    colors: [
                                      Color(0xFF090909),
                                      Color(0xFF293851),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: const Center(
                                  child: Text(
                                    'تسجيل الدخول',
                                    textAlign: TextAlign.center,
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
                          ),
                        ),
                        const SizedBox(height: 25),
                        InkWell(
                          onTap: () {
                            GoRouter.of(context).push(AppRouter.KChooseLocationSecond);
                          },
                          child: SizedBox(
                            width: 300,
                            height: 50,
                            child: Center(
                              child: Container(
                                width: 300,
                                height: 50,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'إنشاء حساب',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF090909),
                                      fontSize: 20,
                                      fontFamily: 'Alexandria',
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.80,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 86),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
