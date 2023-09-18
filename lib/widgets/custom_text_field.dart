import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce/utils/screen_util.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool? obscure;
  final String? obscuringCharacter;
  final TextInputType? keyboardType;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    this.obscure,
    this.obscuringCharacter,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: screenWidth * 0.025,
          right: screenWidth * 0.025,
          bottom: screenHeight * 0.025),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          filled: true,
          fillColor: Theme.of(context).colorScheme.inversePrimary,
          label: AutoSizeText(label),
        ),
        keyboardType: keyboardType ?? TextInputType.text,
        obscureText: obscure ?? false,
        obscuringCharacter: obscure == true ? obscuringCharacter! : ' ',
        onChanged: (value) {},
      ),
    );
  }
}
