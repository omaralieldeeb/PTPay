import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ptpay/core/utils/gorouter.dart';
import 'package:ptpay/core/widget/LinearGradien.dart';
import 'package:ptpay/core/widget/logo.dart';

class ConfirmAccountCreation extends StatelessWidget {
  const ConfirmAccountCreation({super.key});

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
                  const Logo(), // اللوجو
                  const SizedBox(height: 85),

                  // النصوص مع الاتجاه من اليمين إلى اليسار
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      children: const [
                        Text(
                          "تم إنشاء الحساب",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontFamily: 'Alexandria',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "تم إنشاء حسابك بنجاح\nاضغط على زر المتابعة لتوجيهك الى الصفحة الرئيسية\n"
                              "يرجى الذهاب الى أقرب فرع لاستلام كارت ال NFC \nالخاص بك",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Alexandria',
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 35),

                  // الأيقونة
                  Container(
                    width: 125,
                    height: 125,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/icon.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  const SizedBox(height: 160),

                  // زر المتابعة
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
