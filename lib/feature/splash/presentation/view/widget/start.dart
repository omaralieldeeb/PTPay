import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ptpay/core/utils/gorouter.dart';
import 'package:ptpay/feature/splash/presentation/view/widget/languageButton.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          GoRouter.of(context).push(AppRouter.KOnBoardingScreen);
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/splash1.png',
              fit: BoxFit.cover,
            ),

            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Column(
                  children: [
                    SizedBox(height: 10),

                    // عنوان التطبيق
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'PT',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontFamily: 'Spantaran',
                            fontWeight: FontWeight.w400,
                            shadows: [
                              Shadow(
                                offset: Offset(-4, 4),
                                blurRadius: 0,
                                color: Color(0xFF000000).withOpacity(0.25),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 5), // مسافة بين النصوص

                        // كلمة "Pay" مع التدرج اللوني
                        ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              colors: [
                                Color(0xFFF4D800), // الأصفر فوق
                                Color(0xFFFF6A00), // البرتقالي تحت
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ).createShader(bounds);
                          },
                          child: Text(
                            'Pay',
                            style: TextStyle(
                              fontSize: 34,
                              fontFamily: 'Spantaran',
                              fontWeight: FontWeight.w400,
                              color: Colors.white, // مهم عشان يطبق التدرج
                            ),
                          ),
                        ),
                      ],
                    ),

                    // الوصف
                    Expanded(
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          'وسيلتك الأسهل للدفع\nفي وسائل الموصلات.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: 'Alexandria',
                            fontWeight: FontWeight.w600,
                            height: 1.80,
                            letterSpacing: 0.75,
                            shadows: [
                              Shadow(
                                offset: Offset(0, 4),
                                blurRadius: 4,
                                color: Color(0xFF000000).withOpacity(0.25),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // أزرار اللغة
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LanguageButton(text: "English"),
                        SizedBox(width: 15),
                        LanguageButton(text: "عربى"),
                      ],
                    ),

                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
