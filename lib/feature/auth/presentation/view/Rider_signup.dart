import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ptpay/core/utils/api_service.dart';
import 'package:ptpay/core/utils/gorouter.dart';
import 'package:ptpay/core/widget/LinearGradien.dart';
import 'package:ptpay/core/widget/logo.dart';
import 'package:ptpay/feature/auth/presentation/view/widget/Rider_signup_widgets/CheckboxWidegt.dart';
import 'package:ptpay/feature/auth/presentation/view/widget/Rider_signup_widgets/SaveButtonSignUp.dart';
import 'package:ptpay/feature/auth/presentation/view/widget/Rider_signup_widgets/ValidationRowSignup.dart';
import 'package:ptpay/feature/auth/presentation/view/widget/Rider_signup_widgets/buildPasswordField.dart';
import 'package:ptpay/feature/auth/presentation/view/widget/Rider_signup_widgets/buildTextField.dart';

class SignUpPageRider extends StatefulWidget {
  const SignUpPageRider({super.key});

  @override
  State<SignUpPageRider> createState() => _SignUpPageRiderState();
}

class _SignUpPageRiderState extends State<SignUpPageRider> {
  final _formKey = GlobalKey<FormState>();


  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool isFormValid = true;
  bool _isChecked = false;

  bool _isPasswordValid = false;
  bool _isMatch = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  void _validateForm() {
    setState(() {
      isFormValid = _nameController.text.isNotEmpty &&
          _idController.text.isNotEmpty &&
          _phoneController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _isPasswordValid &&
          _isMatch &&
          _isChecked;
    });
  }

  void _validatePassword(String password) {
    final hasUpperCase = password.contains(RegExp(r'[A-Z]'));
    final hasSpecialChar = password.contains(RegExp(r'[!@#\\$%^&*(),.?":{}|<>]'));
    final isValidLength = password.length >= 8;

    setState(() {
      _isPasswordValid = isValidLength && hasUpperCase && hasSpecialChar;
      _isMatch = password == _confirmPasswordController.text;
    });
    _validateForm();
  }

  void _validateConfirmPassword(String confirmPassword) {
    setState(() {
      _isMatch = confirmPassword == _passwordController.text;
    });
    _validateForm();
  }

  final ApiService _apiService = ApiService(Dio());
  Future<void> _registerUser() async {
    if (!isFormValid) return;

    final Map<String, dynamic> data = {
      "full_name": _nameController.text,
      "national_id": _idController.text,
      "phone": _phoneController.text,
      "email": _emailController.text,
      "password": _passwordController.text,
      "password2": _confirmPasswordController.text,
    };

    try {
      final response = await _apiService.post(
        endpoint: 'https://ahmed808.pythonanywhere.com/api/register/user/', // استبدل الرابط بالرابط الصحيح
        data: data,
      );

      if (response) {
        GoRouter.of(context).push(AppRouter.KOTP);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("فشل التسجيل، يرجى المحاولة مرة أخرى")),
        );
      }
    } on DioException catch (e) {
      String errorMessage = "حدث خطأ أثناء الاتصال بالخادم";

      if (e.response != null) {
        errorMessage = "خطأ من الخادم: ${e.response!.statusMessage}";
      } else if (e.type == DioExceptionType.connectionError) {
        errorMessage = "تعذر الاتصال بالخادم. تأكد من اتصالك بالإنترنت.";
      } else if (e.type == DioExceptionType.connectionTimeout) {
        errorMessage = "انتهت مهلة الاتصال بالخادم.";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("حدث خطأ غير متوقع")),
      );
    }
  }



    @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(color: Colors.white, height: MediaQuery.of(context).size.height),
            const Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Lineargradien(),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(child: Logo()),
                      const SizedBox(height: 10),
                      const Center(
                        child: Text("إنشاء حساب راكب", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black)),
                      ),
                      const SizedBox(height: 20),
                      buildTextField(label: "الإسم الكامل", hint: "الاسم بالكامل", controller: _nameController, onChanged: (_) => _validateForm()),
                      buildTextField(label: "الرقم القومي أو رقم جواز السفر", hint: "12345678901234", controller: _idController, keyboardType: TextInputType.number, onChanged: (_) => _validateForm()),
                      buildTextField(label: "رقم الهاتف", hint: "+20 رقم الهاتف", controller: _phoneController, keyboardType: TextInputType.phone, onChanged: (_) => _validateForm()),
                      buildTextField(label: "البريد الإلكتروني", hint: "someone@example.com", controller: _emailController, keyboardType: TextInputType.emailAddress, onChanged: (_) => _validateForm()),
                      Column(
                        children: [
                          PasswordFieldSignup(
                            label: 'كلمة المرور',
                            controller: _passwordController,
                            isVisible: _isPasswordVisible,
                            onChanged: _validatePassword,
                            toggleVisibility: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                          ),
                          ValidationRowSignup(text: 'يجب أن لا تقل كلمة المرور عن 8 أحرف', isValid: _isPasswordValid),
                          ValidationRowSignup(text: 'يجب أن تحتوي كلمة المرور على رموز (#, @, \$)', isValid: _isPasswordValid),
                          ValidationRowSignup(text: 'يجب أن تحتوي كلمة المرور على حروف كبيرة (A-Z)', isValid: _isPasswordValid),
                          const SizedBox(height: 15),
                          PasswordFieldSignup(
                            label: 'تأكيد كلمة المرور',
                            controller: _confirmPasswordController,
                            isVisible: _isConfirmPasswordVisible,
                            onChanged: _validateConfirmPassword,
                            toggleVisibility: () => setState(() => _isConfirmPasswordVisible = !_isConfirmPasswordVisible),
                          ),
                          ValidationRowSignup(text: 'متطابقتان', isValid: _isMatch),
                        ],
                      ),
                      const SizedBox(height: 10),
                      CheckboxWidget(
                        onChanged: (acceptUpdates, acceptTerms) {
                          setState(() {
                            _isChecked = acceptTerms;
                            _isChecked = acceptUpdates;
                          });
                          _validateForm();
                        },
                      ),
                      const SizedBox(height: 20),
                      SaveButtonSignUp(
                        isFormValid: isFormValid,
                        onPressed: _registerUser,
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("لديك حساب ؟ ", style: TextStyle(fontSize: 17, color: Color(0xff979797))),
                          InkWell(
                            onTap: () => GoRouter.of(context).push(AppRouter.KChooseLocationFirst),
                            child: const Text(" تسجيل الدخول  ", style: TextStyle(fontSize: 17, color: Colors.black)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
