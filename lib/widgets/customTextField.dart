import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final IconData icon; 
  final String hintText; 
  final bool isPassword; 
  final Widget? suffixIcon; 
  final String? Function(String?)? validator; 

  const CustomTextField({
    required this.icon,
    required this.hintText,
    this.isPassword = false,
    this.suffixIcon,
    this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword, // إخفاء النص إذا كان الحقل كلمة مرور
      validator: validator, 
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.blue),
        suffixIcon: suffixIcon, // أيقونة إضافية للحقل (مثل إظهار/إخفاء كلمة المرور)
        hintText: hintText, 
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
      ),
    );
  }
}