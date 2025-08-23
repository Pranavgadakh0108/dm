import 'package:flutter/material.dart';

class DigitsGrid extends StatelessWidget {
  final List<int> digits;
  const DigitsGrid({super.key, required this.digits});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 12,
    );
  }
}