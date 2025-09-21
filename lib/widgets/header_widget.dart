import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String userName;

  const HeaderWidget({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Stack(
        children: [
          // Teks di kiri atas
          Positioned(
            top: 32, // geser teks ke atas (ubah sesuai selera, misal 0 atau 12)
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, $userName!',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C2C2C),
                  ),
                ),
                const Text(
                  'Let\'s start taking a notes',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ],
            ),
          ),
          // characters
          Positioned(
            right: -6,
            top: 18,
            child: SizedBox(
              width: 225,
              height: 125,
              child: Image.asset(
                'assets/images/character.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
