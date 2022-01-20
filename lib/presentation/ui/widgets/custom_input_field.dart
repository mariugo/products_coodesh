import 'package:flutter/material.dart';

import 'package:products_coodesh/presentation/ui/theme/design_system.dart';

class CustomInputField extends StatelessWidget {
  final Function(dynamic) onSaved;
  final String regEx;
  final String labelText;
  final TextInputType textInputType;
  final String initialValue;

  const CustomInputField({
    Key? key,
    required this.onSaved,
    required this.regEx,
    required this.labelText,
    required this.textInputType,
    required this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue.toString(),
      keyboardType: textInputType,
      onSaved: (_value) => onSaved(_value!),
      cursorColor: DS.primaryColor,
      style: DS.ctaText,
      validator: (_value) {
        return RegExp(regEx).hasMatch(_value!) ? null : 'Campo inválido';
      },
      decoration: InputDecoration(
        labelText: labelText,
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: DS.primaryColor,
          ),
        ),
        labelStyle: DS.ctaText,
        focusColor: DS.primaryColor,
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  final Function(dynamic) onEditingComplete;
  final String hintText;
  final TextEditingController controller;

  const CustomTextField({
    Key? key,
    required this.onEditingComplete,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onEditingComplete: () =>
          widget.onEditingComplete(widget.controller.value.text),
      cursorColor: DS.primaryColor,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintText: widget.hintText,
        hintStyle: DS.ctaText,
      ),
    );
  }
}
