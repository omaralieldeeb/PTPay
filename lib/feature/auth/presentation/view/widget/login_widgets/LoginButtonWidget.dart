import 'package:flutter/material.dart';

class LoginButtonWidget extends StatelessWidget {
  final bool isDataEntered;
  final VoidCallback onTap;

  const LoginButtonWidget({
    super.key,
    required this.isDataEntered,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 50,
        decoration: BoxDecoration(
          gradient: isDataEntered
              ? const LinearGradient(
            colors: [
              Color(0xFF090909),
              Color(0xFF293851),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
              : const LinearGradient(
            colors: [
              Colors.white,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            if (!isDataEntered)
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
          ],
        ),
        child: Center(
          child: Text(
            'تسجيل الدخول',
            style: TextStyle(
              color: isDataEntered ? Colors.white :const Color(0xffACACAC),
              fontSize: 20,
              fontFamily: 'Alexandria',
              fontWeight: FontWeight.w700,
              letterSpacing: 0.80,
            ),
          ),
        ),
      ),
    );
  }
}
