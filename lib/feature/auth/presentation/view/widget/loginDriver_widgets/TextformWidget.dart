import 'package:flutter/material.dart';

class TextformWidgetDriver extends StatefulWidget {
  final TextEditingController phoneController;
  final TextEditingController licenseController;
  final TextEditingController passwordController;
  final Function(String phone, String license, String password) onDataEntered;

  const TextformWidgetDriver({
    super.key,
    required this.phoneController,
    required this.licenseController,
    required this.passwordController,
    required this.onDataEntered,
  });

  @override
  State<TextformWidgetDriver> createState() => _TextformWidgetDriverState();
}

class _TextformWidgetDriverState extends State<TextformWidgetDriver> {
  bool _isPasswordHidden = true;

  @override
  void initState() {
    super.initState();
    widget.phoneController.addListener(_onTextChanged);
    widget.licenseController.addListener(_onTextChanged);
    widget.passwordController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    widget.onDataEntered(
      widget.phoneController.text,
      widget.licenseController.text,
      widget.passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          _buildTextField("أدخل رقم الهاتف", "رقم الهاتف", widget.phoneController, TextInputType.phone),
          const SizedBox(height: 20),
          _buildTextField("أدخل رقم الرخصة", "رقم الرخصة", widget.licenseController, TextInputType.text),
          const SizedBox(height: 20),
          _buildPasswordField(),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String hint, TextEditingController controller, TextInputType keyboardType) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 17,
              fontFamily: 'Alexandria',
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              fontSize: 14,
              fontFamily: 'Alexandria',
              fontWeight: FontWeight.w500,
              color: Color(0xff979797),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            hintStyle: const TextStyle(
              fontSize: 14,
              fontFamily: 'Alexandria',
              fontWeight: FontWeight.w500,
              color: Color(0xff979797),
            ),
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
    );
  }
}
