import 'package:flutter/material.dart';
import 'package:ptpay/core/widget/logo.dart';
import 'package:ptpay/core/widget/LinearGradien.dart';
import 'package:ptpay/feature/auth/presentation/view/widget/resetpassword_widget/buildSaveButton.dart';
import 'package:ptpay/feature/auth/presentation/view/widget/resetpassword_widget/buildValidationRow.dart';
import 'package:ptpay/feature/auth/presentation/view/widget/resetpassword_widget/buildpasswordField.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isPasswordValid = false;
  bool _hasUpperCase = false;
  bool _hasSpecialChar = false;
  bool _isMatch = false;

  void _validatePassword(String password) {
    setState(() {
      _isPasswordValid = password.length >= 8;
      _hasUpperCase = password.contains(RegExp(r'[A-Z]'));
      _hasSpecialChar = password.contains(RegExp(r'[!@#\\\$%^&*(),.?":{}|<>]'));
      _isMatch = password == _confirmPasswordController.text;
    });
  }

  void _validateConfirmPassword(String confirmPassword) {
    setState(() {
      _isMatch = confirmPassword == _passwordController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isFormValid = _isPasswordValid && _hasUpperCase && _hasSpecialChar && _isMatch;

    return Scaffold(
      resizeToAvoidBottomInset: true,
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
            SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Center(child: Logo()),
                    const SizedBox(height: 27),
                    const Center(
                      child: Text(
                        'إعادة تعيين كلمة المرور',
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500,fontFamily: 'Alexandria'),
                      ),
                    ),
                    const SizedBox(height: 50),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'اختر كلمة مرور جديدة لحسابك',
                        style: TextStyle(fontSize: 17, fontFamily: 'Alexandria',fontWeight: FontWeight.w400,color: Colors.black54),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'تأكد أنها قوية وآمنة',
                        style: TextStyle(fontSize: 17, fontFamily: 'Alexandria',fontWeight: FontWeight.w400,color: Colors.black54),
                      ),
                    ),
                    const SizedBox(height: 30),
                    PasswordField(
                      label: 'كلمة المرور الجديدة',
                      controller: _passwordController,
                      isVisible: _isPasswordVisible,
                      onChanged: _validatePassword,
                      toggleVisibility: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                    ValidationRow(
                      text: 'يجب أن لا تقل كلمة المرور عن 8 أحرف',
                      isValid: _isPasswordValid,
                    ),
                    ValidationRow(
                      text: 'يجب أن تحتوي كلمة المرور على رموز (#, @, \$)',
                      isValid: _hasSpecialChar,
                    ),
                    ValidationRow(
                      text: 'يجب أن تحتوي كلمة المرور على حروف كبيرة (A-Z)',
                      isValid: _hasUpperCase,
                    ),
                    const SizedBox(height: 15),
                    PasswordField(
                      label: 'تأكيد كلمة المرور الجديدة',
                      controller: _confirmPasswordController,
                      isVisible: _isConfirmPasswordVisible,
                      onChanged: _validateConfirmPassword,
                      toggleVisibility: () {
                        setState(() {
                          _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                        });
                      },
                    ),
                    ValidationRow(
                      text: 'متطابقتان',
                      isValid: _isMatch,
                    ),
                    const SizedBox(height: 190),
                    SaveButton(isFormValid: isFormValid),
                    const SizedBox(height: 30),
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
