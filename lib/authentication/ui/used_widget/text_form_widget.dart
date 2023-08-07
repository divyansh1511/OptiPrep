import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller_;

  const CustomTextFormField({
    required this.labelText,
    required this.controller_,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        controller: controller_,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required.';
          }
          return null; // Return null if the input is valid.
        },
        style: const TextStyle(
          color: Colors.grey,
          // backgroundColor: Colors.grey,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.grey,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
