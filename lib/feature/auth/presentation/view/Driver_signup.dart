import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ptpay/core/utils/gorouter.dart';
import 'package:ptpay/core/widget/LinearGradien.dart';
import 'package:ptpay/core/widget/logo.dart';
import 'package:ptpay/feature/auth/presentation/view/widget/Driver_signup_widgets/CheckboxWidegt.dart';
import 'package:ptpay/feature/auth/presentation/view/widget/Driver_signup_widgets/SaveButtonSignUp.dart';
import 'package:ptpay/feature/auth/presentation/view/widget/Driver_signup_widgets/ValidationRowSignup.dart';
import 'package:ptpay/feature/auth/presentation/view/widget/Driver_signup_widgets/buildPasswordField.dart';
import 'package:ptpay/feature/auth/presentation/view/widget/Driver_signup_widgets/buildTextField.dart';

class SignUpPageDriver extends StatefulWidget {
  const SignUpPageDriver({super.key});

  @override
  State<SignUpPageDriver> createState() => _SignUpPageDriverState();
}

class _SignUpPageDriverState extends State<SignUpPageDriver> {
  final _formKey = GlobalKey<FormState>();
  bool isFormValid = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _carNameController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isChecked = false;
  bool _isPasswordValid = false;
  bool _isMatch = false;
  File? _selectedImage;

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

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
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
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: const Lineargradien(),
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
                        child: Text(
                          "إنشاء حساب سائق",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
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
                      Text(
                        "الصورة الشخصية",
                        style: TextStyle(fontSize: 16, fontFamily: 'Alexandria', fontWeight: FontWeight.w400),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: InkWell(
                          onTap: _pickImage,
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(16),
                            dashPattern: [6, 4],
                            color: Colors.black,
                            strokeWidth: 2,
                            child: Container(
                              width: 390,
                              height: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: _selectedImage == null
                                  ? const Icon(Icons.add_photo_alternate, size: 50, color: Colors.black)
                                  : ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.file(
                                  _selectedImage!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Column(
                        children: [
                          PasswordFieldSignupDriver(
                            label: 'كلمة المرور',
                            controller: _passwordController,
                            isVisible: _isPasswordVisible,
                            onChanged: (password) {
                              setState(() {
                                _isPasswordValid = password.length >= 8;
                                _isMatch = password == _confirmPasswordController.text;
                              });
                              _validateForm();
                            },
                            toggleVisibility: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                          ),
                          ValidationRowSignupDriver(
                            text: 'يجب أن لا تقل كلمة المرور عن 8 أحرف',
                            isValid: _isPasswordValid,
                          ),
                          const SizedBox(height: 15),
                          PasswordFieldSignupDriver(
                            label: 'تأكيد كلمة المرور',
                            controller: _confirmPasswordController,
                            isVisible: _isConfirmPasswordVisible,
                            onChanged: (confirmPassword) {
                              setState(() {
                                _isMatch = confirmPassword == _passwordController.text;
                              });
                              _validateForm();
                            },
                            toggleVisibility: () => setState(() => _isConfirmPasswordVisible = !_isConfirmPasswordVisible),
                          ),
                          ValidationRowSignupDriver(
                            text: 'متطابقتان',
                            isValid: _isMatch,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
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
                      Text(
                        "صورة الرخصة",
                        style: TextStyle(fontSize: 16, fontFamily: 'Alexandria', fontWeight: FontWeight.w400),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: InkWell(
                          onTap: _pickImage,
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(16),
                            dashPattern: [6, 4],
                            color: Colors.black,
                            strokeWidth: 2,
                            child: Container(
                              width: 390,
                              height: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: _selectedImage == null
                                  ? const Icon(Icons.add_photo_alternate, size: 50, color: Colors.black)
                                  : ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.file(
                                  _selectedImage!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
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
                      SaveButtonSignUpDriver(isFormValid: isFormValid),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "لديك حساب ؟ ",
                            style: TextStyle(fontSize: 17, color: Color(0xff979797)),
                          ),
                          InkWell(
                            onTap: () => GoRouter.of(context).push(AppRouter.KChooseLocationFirst),
                            child: const Text(
                              " تسجيل الدخول  ",
                              style: TextStyle(fontSize: 17, color: Colors.black),
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