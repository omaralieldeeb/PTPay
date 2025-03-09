import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ptpay/core/utils/api_service1.dart';
import 'package:ptpay/core/utils/gorouter.dart';
import 'package:ptpay/core/widget/LinearGradien.dart';
import 'package:ptpay/core/widget/logo.dart';
import 'package:ptpay/feature/auth/presentation/view/widget/Driver_signup_widgets/CheckboxWidegt.dart';
import 'package:ptpay/feature/auth/presentation/view/widget/Driver_signup_widgets/SaveButtonSignUp.dart';
import 'package:ptpay/feature/auth/presentation/view/widget/Driver_signup_widgets/ValidationRowSignup.dart';
import 'package:ptpay/feature/auth/presentation/view/widget/Driver_signup_widgets/buildPasswordField.dart';
import 'package:ptpay/feature/auth/presentation/view/widget/Driver_signup_widgets/buildTextField.dart';
import 'package:ptpay/feature/auth/presentation/view/widget/Driver_signup_widgets/image_picker.dart';


class SignUpPageDriver extends StatefulWidget {
  const SignUpPageDriver({super.key});

  @override
  State<SignUpPageDriver> createState() => _SignUpPageDriverState();
}

class _SignUpPageDriverState extends State<SignUpPageDriver> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _carNameController = TextEditingController();
  final TextEditingController _personalImageController = TextEditingController();
  final TextEditingController _licenseImageController = TextEditingController();

  bool isFormValid = false;
  bool _isChecked = false;
  bool _isPasswordLengthValid = false;
  bool _hasUpperCase = false;
  bool _hasSpecialChar = false;
  bool _isMatch = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  void _validateForm() {
    setState(() {
      isFormValid = _nameController.text.isNotEmpty &&
          _idController.text.isNotEmpty &&
          _phoneController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _isPasswordLengthValid &&
          _hasUpperCase &&
          _hasSpecialChar &&
          _isMatch &&
          _isChecked;
    });
  }

  File? _selectedImage;
  void _validatePassword(String password) {
    bool isLengthValid = password.length >= 8;
    bool hasUpperCase = password.contains(RegExp(r'[A-Z]'));
    bool hasSpecialChar = password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));
    bool isMatch = password == _confirmPasswordController.text;

    setState(() {
      _isPasswordLengthValid = isLengthValid;
      _hasUpperCase = hasUpperCase;
      _hasSpecialChar = hasSpecialChar;
      _isMatch = isMatch;
    });
    _validateForm();
  }

  void _validateConfirmPassword(String confirmPassword) {
    bool isMatch = confirmPassword == _passwordController.text;
    setState(() {
      _isMatch = isMatch;
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
      "driver_photo": await MultipartFile.fromFile(_personalImageController.text),
      "password": _passwordController.text,
      "password2": _confirmPasswordController.text,
      "license_number": _carNameController.text,
      "license_photo": await MultipartFile.fromFile(_licenseImageController.text),
    };

    try {
      final response = await _apiService.post(
        endpoint: 'https://ahmed808.pythonanywhere.com/api/register/driver/',
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
            SingleChildScrollView(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(child: Logo()),
                      const SizedBox(height: 10),
                      const Center(
                        child: Text(
                          "إنشاء حساب سائق",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        " 1- البيانات الأساسية",
                        style: TextStyle(fontSize: 18, fontFamily: 'Alexandria', fontWeight: FontWeight.w500),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 10),
                      buildTextFieldDriver(
                        label: "الإسم الكامل",
                        hint: "الاسم بالكامل",
                        controller: _nameController,
                        onChanged: (_) => _validateForm(),
                      ),
                      buildTextFieldDriver(
                        label: "الرقم القومي أو رقم جواز السفر",
                        hint: "12345678901234",
                        controller: _idController,
                        keyboardType: TextInputType.number,
                        onChanged: (_) => _validateForm(),
                      ),
                      buildTextFieldDriver(
                        label: "رقم الهاتف",
                        hint: "+20 رقم الهاتف",
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        onChanged: (_) => _validateForm(),
                      ),
                      buildTextFieldDriver(
                        label: "البريد الإلكتروني",
                        hint: "someone@example.com",
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (_) => _validateForm(),
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "الصورة الشخصية",
                        style: TextStyle(fontSize: 16, fontFamily: 'Alexandria', fontWeight: FontWeight.w400),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 8),
                      ImagePickerWidget(
                        onImageSelected: (File? image) {
                          setState(() {
                            _personalImageController.text = image?.path ?? '';
                          });
                        },
                      ),
                      const SizedBox(height: 15),
                      Column(
                        children: [
                          PasswordFieldSignupDriver(
                            label: 'كلمة المرور',
                            controller: _passwordController,
                            isVisible: _isPasswordVisible,
                            onChanged: _validatePassword,
                            toggleVisibility: () => setState(
                                    () => _isPasswordVisible = !_isPasswordVisible),
                          ),
                          ValidationRowSignupDriver(
                            text: 'يجب أن لا تقل كلمة المرور عن 8 أحرف',
                            isValid: _isPasswordLengthValid,
                          ),
                          ValidationRowSignupDriver(
                            text:
                            'يجب أن تحتوي كلمة المرور على رموز مثل (!,@,#,\$,)',
                            isValid: _hasSpecialChar,
                          ),
                          ValidationRowSignupDriver(
                            text:
                            'يجب أن تحتوي كلمة المرور على حروف كبيرة (A-Z)',
                            isValid: _hasUpperCase,
                          ),
                          const SizedBox(height: 15),
                          PasswordFieldSignupDriver(
                            label: 'تأكيد كلمة المرور',
                            controller: _confirmPasswordController,
                            isVisible: _isConfirmPasswordVisible,
                            onChanged: _validateConfirmPassword,
                            toggleVisibility: () => setState(() =>
                            _isConfirmPasswordVisible =
                            !_isConfirmPasswordVisible),
                          ),
                          ValidationRowSignupDriver(
                            text: 'متطابقتان',
                            isValid: _isMatch,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        " 2- بيانات المركبة والرخصة",
                        style: TextStyle(fontSize: 18, fontFamily: 'Alexandria', fontWeight: FontWeight.w500),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 10),
                      buildTextFieldDriver(
                        label: "رقم الرخصة (الموجود في الخلفية)",
                        hint: "D/1234567",
                        controller: _carNameController,
                        onChanged: (_) => _validateForm(),
                      ),
                      const Text(
                        "صورة الرخصة",
                        style: TextStyle(fontSize: 16, fontFamily: 'Alexandria', fontWeight: FontWeight.w400),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 8),
                      ImagePickerWidget(
                        onImageSelected: (File? image) {
                          setState(() {
                            _personalImageController.text = image?.path ?? '';
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      CheckboxWidgetDriver(
                        onChanged: (acceptUpdates, acceptTerms) {
                          setState(() {
                            _isChecked = acceptTerms;
                          });
                          _validateForm();
                        },
                      ),
                      const SizedBox(height: 20),
                      SaveButtonSignUpDriver(
                        isFormValid: isFormValid,
                        onPressed: _registerUser,
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "لديك حساب ؟ ",
                            style: TextStyle(
                                fontSize: 17, color: Color(0xff979797)),
                          ),
                          InkWell(
                            onTap: () => GoRouter.of(context)
                                .push(AppRouter.KChooseLocationFirst),
                            child: const Text(
                              " تسجيل الدخول  ",
                              style:
                              TextStyle(fontSize: 17, color: Colors.black),
                            ),
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
