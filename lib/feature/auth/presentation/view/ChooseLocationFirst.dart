import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ptpay/core/utils/gorouter.dart';
import 'package:ptpay/core/widget/LinearGradien.dart';
import 'package:ptpay/core/widget/logo.dart';
import 'package:ptpay/feature/auth/presentation/view/widget/ChooseLocationFirst_widget/optioncard.dart';

class ChooseLocationFirst extends StatelessWidget {
  const ChooseLocationFirst({super.key});

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
          Column(
            children: [
              const SizedBox(height: 60),
              const Logo(),
              const SizedBox(height: 130),
              const Text(
                'هل أنت..؟',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Alexandria',
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OptionCard(
                    image: 'assets/images/driver.png',
                    label: 'سائق',
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.KLoginPageDriver);
                    },
                  ),
                  OptionCard(
                    image: 'assets/images/rider.png',
                    label: 'راكب',
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.KLoginPageRider);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 220),
              InkWell(
                onTap: () {
                  //Navigator.pushNamed(context, '/StartLoginPage');
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
                      'التالي',
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
              const SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }
}
