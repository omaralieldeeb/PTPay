import 'package:flutter/material.dart';
import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:ptpay/core/utils/gorouter.dart';

class WellcomePage extends StatefulWidget {
  @override
  _WellcomePageState createState() => _WellcomePageState();
}

class _WellcomePageState extends State<WellcomePage> {
  @override
  void initState() {
    super.initState();
    // الانتقال تلقائي بعد 3 ثوانى
    Future.delayed(Duration(seconds: 3), () {
      GoRouter.of(context).push(AppRouter.KStartScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF0E0E10),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 88,
                      width: 172,
                    ),
                  ],
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: 'موصلاتك ',
                        style: TextStyle(color: Color(0xFFFFA500)),
                      ),
                      TextSpan(text: 'في مصر'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
