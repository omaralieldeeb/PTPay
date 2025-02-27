import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center, // يجعل العناصر تتمركز في المنتصف
      children: [
        Container(
          height: 80,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF090909), Color(0xFF293851)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, -3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navBarItem("المزيد", "assets/icon/more.png", 0),
              _navBarItem("عروض", "assets/icon/fire.png", 1),
              const SizedBox(width: 80), // المسافة التي تترك مكان للزر العائم
              _navBarItem("السجل", "assets/icon/archive.png", 2),
              _navBarItem("الرئيسية", "assets/icon/home.png", 3),
            ],
          ),
        ),

        // زر الـ QR العائم في المنتصف
        Positioned(
          top: -15,
          left: 168,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(
                child: Image.asset(
                  "assets/icon/qq.png",
                  width: 70,
                  height: 70,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _navBarItem(String title, String iconPath, int index) {
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(iconPath, width: 26, height: 26),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontFamily: 'Alexandria',
            ),
          ),
        ],
      ),
    );
  }
}
