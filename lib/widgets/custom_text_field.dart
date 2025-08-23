import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? prefixText;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.keyboardType,
    this.prefixText,
    this.obscureText = false, this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.pink,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14, color: Colors.black),
        prefixText: prefixText,
        suffixIcon: Icon(icon),
        suffixIconColor: Colors.black,
        // contentPadding: const EdgeInsets.symmetric(
        //   horizontal: 15,
        //   vertical: 15,
        // ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.04,
          vertical: MediaQuery.of(context).size.height * 0.015,
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 237, 237, 237),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
