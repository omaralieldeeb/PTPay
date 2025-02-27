import 'package:flutter/material.dart';

class TextformWidget extends StatefulWidget {
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final Function(String phone, String password) onDataEntered;

  const TextformWidget({
    super.key,
    required this.phoneController,
    required this.passwordController,
    required this.onDataEntered,
  });

  @override
  State<TextformWidget> createState() => _TextformWidgetState();
}

class _TextformWidgetState extends State<TextformWidget> {
  bool _isPasswordHidden = true;

  @override
  void initState() {
    super.initState();
    widget.phoneController.addListener(_onTextChanged);
    widget.passwordController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    widget.onDataEntered(
      widget.phoneController.text,
      widget.passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              "أدخل رقم الهاتف",
              style: TextStyle(
                fontSize: 17,
                fontFamily: 'Alexandria',
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 5),
          TextFormField(
            controller: widget.phoneController,
            keyboardType: TextInputType.phone,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintText: 'رقم الهاتف',
              hintStyle:const TextStyle(
                fontSize: 14,
                fontFamily: 'Alexandria',
                fontWeight: FontWeight.w500,
                color: Color(0xff979797),),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 40),
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              "أدخل كلمة المرور",
              style: TextStyle(
                fontSize: 17,
                fontFamily: 'Alexandria',
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 5),
          TextFormField(
            controller: widget.passwordController,
            obscureText: _isPasswordHidden,
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            decoration: InputDecoration(
              hintText: 'كلمة المرور',
              hintStyle:const TextStyle(
                fontSize: 14,
                fontFamily: 'Alexandria',
                fontWeight: FontWeight.w500,
                color: Color(0xff979797),),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: IconButton(
                icon: Icon(
                  _isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordHidden = !_isPasswordHidden;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
