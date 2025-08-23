import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AlwaysPrefixPhoneFormatter extends TextInputFormatter {
  final String prefix = '+91 ';

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // If user tries to delete the prefix, reset it
    if (!newValue.text.startsWith(prefix)) {
      return TextEditingValue(
        text: prefix,
        selection: TextSelection.collapsed(offset: prefix.length),
      );
    }
    // Prevent cursor from going before prefix
    if (newValue.selection.baseOffset < prefix.length) {
      return TextEditingValue(
        text: newValue.text,
        selection: TextSelection.collapsed(offset: prefix.length),
      );
    }
    return newValue;
  }
}

class CustomPhoneField extends StatelessWidget {
  final TextEditingController controller;

  const CustomPhoneField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller..text = '+91 ',
      keyboardType: TextInputType.phone,
      cursorColor: Colors.pink,
      inputFormatters: [AlwaysPrefixPhoneFormatter()],
      decoration: InputDecoration(
        suffixIcon: const Icon(Icons.mobile_friendly),
        suffixIconColor: Colors.black,
        // contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
