import 'package:flutter/material.dart';
class OptionCard extends StatelessWidget {
  final String image;
  final String label;
  final VoidCallback onTap;

  const OptionCard({super.key, required this.image, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 70,
            child: CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage(image),
              backgroundColor: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600,fontFamily: 'Alexandria'),
          ),
        ],
      ),
    );
  }
}