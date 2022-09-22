import 'package:flutter/material.dart';

class CustomFormFiled extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData? icon;
  final bool autoFocus;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final bool lastField;
  final TextInputType? textInputType;
  final bool required;
  const CustomFormFiled(
      {super.key,
      required this.controller,
      required this.label,
      required this.hint,
      this.icon,
      this.autoFocus = false,
      this.lastField = false,
      this.focusNode,
      this.nextFocus,
      this.textInputType,
      this.required = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: textInputType,
        textInputAction:
            lastField ? TextInputAction.done : TextInputAction.next,
        autofocus: autoFocus,
        focusNode: focusNode,
        controller: controller,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            label: Text(label),
            hintText: hint,
            prefixIcon: Icon(icon),
            suffixIcon: IconButton(
              onPressed: controller.clear,
              icon: const Icon(Icons.clear),
              autofocus: false,
            )),
        onFieldSubmitted: (value) {
          if (nextFocus != null) {
            FocusScope.of(context).requestFocus(nextFocus);
          }
        },
        validator: (value) {
          if (required) {
            if (value == null || value.isEmpty) {
              return 'Please fill the $label field';
            }
          }
          return null;
        },
      ),
    );
  }
}
