import 'package:flutter/material.dart';

class OTPSubmitButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback onSubmit;

  const OTPSubmitButton({
    Key? key,
    required this.isEnabled,
    required this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnabled ? onSubmit : null,
      child: Container(
        width: 300,
        height: 50,
        decoration: BoxDecoration(
          gradient: isEnabled
              ? const LinearGradient(
            colors: [Color(0xFF090909), Color(0xFF293851)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
              : null,
          color: !isEnabled ? Colors.white : null,
          borderRadius: BorderRadius.circular(25),
          boxShadow: !isEnabled
              ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ]
              : [],
        ),
        child: Center(
          child: Text(
            'إرسال الكود',
            style: TextStyle(
              color: isEnabled ? Colors.white : const Color(0xFF979797),
              fontSize: 16,
              fontFamily: 'Alexandria',
              fontWeight: FontWeight.w600,
              letterSpacing: 0.80,
            ),
          ),
        ),
      ),
    );
  }
}
