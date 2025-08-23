import 'package:flutter/material.dart';

class CustomTextfieldScreen1 extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;

  const CustomTextfieldScreen1({
    super.key,
    this.controller,
    this.hintText,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.pink,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        // contentPadding: const EdgeInsets.symmetric(
        //   vertical: 12,
        //   horizontal: 15,
        // ),
        contentPadding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.014,
          horizontal: MediaQuery.of(context).size.width * 0.04,
        ),
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.orange, width: 1.5),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.orange, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
