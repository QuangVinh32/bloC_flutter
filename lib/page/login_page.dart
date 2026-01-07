import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Lấy chiều rộng màn hình
    final screenWidth = MediaQuery.of(context).size.width;

    // Xác định màu text theo width
    Color textColor;
    if (screenWidth < 400) {
      textColor = Colors.red; // mobile nhỏ
    } else if (screenWidth < 800) {
      textColor = Colors.orange; // tablet
    } else {
      textColor = Colors.green; // desktop
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Text(
          'Đây là trang đăng nhập',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
