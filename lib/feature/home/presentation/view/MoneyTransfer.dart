import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ptpay/core/utils/gorouter.dart';
import 'package:ptpay/core/widget/LinearGradien.dart';
import 'package:ptpay/core/widget/logo.dart';
import 'package:ptpay/feature/home/presentation/view/widget/MoneyTranser_widget/LoginButtonMoney.dart';
import 'package:ptpay/feature/home/presentation/view/widget/MoneyTranser_widget/TextformMoney.dart';
import 'package:ptpay/feature/home/presentation/view/widget/MoneyTranser_widget/money.dart';

class MoneyTransfer extends StatefulWidget {
  const MoneyTransfer({super.key});

  @override
  State<MoneyTransfer> createState() => _MoneyTransferState();
}

class _MoneyTransferState extends State<MoneyTransfer> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  bool isButtonEnabled = false;

  void checkInput() {
    setState(() {
      isButtonEnabled = phoneController.text.isNotEmpty && amountController.text.isNotEmpty;
    });
  }

  void showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(
              minHeight: 400,
              maxHeight: MediaQuery.of(context).size.height * 0.8,
            ),
            decoration: BoxDecoration(
              color: Color(0xffD9D9D9), // لون الخلفية رصاصي فاتح
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Color(0xffFF6A00), width: 3), // إطار برتقالي
            ),
            padding: const EdgeInsets.all(16),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'تأكيد عملية التحويل',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Alexandria',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'تفاصيل المستلم:',
                    style: TextStyle(
                      fontFamily: 'Alexandria',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFF6A00),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'الاسم: أحمد مصطفى\nرقم المحفظة: 01234567890',
                    style: TextStyle(
                      fontFamily: 'Alexandria',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'تفاصيل المبلغ:',
                    style: TextStyle(
                      fontFamily: 'Alexandria',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFF6A00),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'المبلغ: 150.00 جنيه\nرسوم التحويل: 2.00 جنيه\nالمبلغ الإجمالي: 152.00 جنيه',
                    style: TextStyle(
                      fontFamily: 'Alexandria',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'طريقة الدفع:',
                    style: TextStyle(
                      fontFamily: 'Alexandria',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFF6A00),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: const [
                      Icon(Icons.check_box, color: Colors.green, size: 20),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          'سيتم خصم المبلغ من رصيد محفظتك في التطبيق',
                          style: TextStyle(
                            fontFamily: 'Alexandria',
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Icon(Icons.warning_outlined, color: Colors.yellow, size: 20),
                      SizedBox(width: 5),
                      Expanded(
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            'تحذير: تأكد من صحة بيانات المستلم. لا يمكن استرجاع الأموال بعد الإرسال.',
                            style: TextStyle(
                              fontFamily: 'Alexandria',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: (){
                          GoRouter.of(context).push(AppRouter.KInvoice);
                        },
                        child: Container(
                          width: 80,
                          height: 30,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 80,
                                  height: 30,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF4DA66B),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 27,
                                top: 2,
                                child: Text(
                                  'تأكيد',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'Alexandria',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){},
                        child: Container(
                          width: 80,
                          height: 30,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 80,
                                  height: 30,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFEB001B),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 27,
                                top: 2,
                                child: Text(
                                  'إلغاء',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'Alexandria',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  @override
  void initState() {
    super.initState();
    phoneController.addListener(checkInput);
    amountController.addListener(checkInput);
  }

  @override
  void dispose() {
    phoneController.dispose();
    amountController.dispose();
    super.dispose();
  }

  void onDataEntered(String phone, String amount) {
    print('رقم الهاتف: $phone');
    print('المبلغ: $amount');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const Positioned.fill(
            child: Lineargradien(),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.arrow_back_ios_new),
                        const SizedBox(width: 5),
                        const Text(
                          'عودة',
                          style: TextStyle(
                            color: Color(0xFF1B1C2B),
                            fontSize: 14,
                            fontFamily: 'Alexandria',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 83, height: 36, child: Logo()),
                    const Text(
                      'تحويل الأموال',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Alexandria',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 34),
                const Money(),
                const SizedBox(height: 20),
                TextformMoney(
                  phoneController: phoneController,
                  moneyController: amountController,
                  onDataEntered: onDataEntered,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 190),
              child: LoginButtonMoney(
                isDataEntered: isButtonEnabled,
                onTap: () {
                  showConfirmationDialog(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
