// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomInputField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final InputBorder? border;
  final TextStyle? labelStyle;
  final bool? enabled;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextStyle? textStyle;
  final OutlineInputBorder? customEnabledBorder;
  final OutlineInputBorder? customFocusedBorder;
  final Color? fillColor;
  final BoxShadow? boxShadow;
  final double? width;
  final double? height;
  final String? Function(String?)? validator;
  bool isError;
  final List<DropdownMenuItem<String>>? dropdownItems;
  final String? dropdownValue;
  final Function(String?)? dropdownOnChanged;

  CustomInputField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText,
    this.border,
    this.labelStyle,
    this.enabled,
    this.maxLength,
    this.keyboardType,
    this.textStyle,
    this.customEnabledBorder,
    this.customFocusedBorder,
    this.fillColor,
    this.boxShadow,
    this.width,
    this.height,
    this.validator,
    this.dropdownItems,
    this.dropdownValue,
    this.dropdownOnChanged,
    this.isError = false,
  }) : super(key: key);

  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        boxShadow: widget.boxShadow != null
            ? [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ]
            : [],
      ),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          if (widget.dropdownItems != null)
            DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                value: widget.dropdownValue,
                items: widget.dropdownItems!,
                onChanged: widget.dropdownOnChanged,
              ),
            ),
          TextFormField(
            controller: widget.controller,
            onChanged: (text) {
              if (widget.validator != null) {
                setState(() {
                  widget.isError = widget.validator!(text) != null;
                });
              }
            },

            enabled: widget.enabled,
            style: widget.textStyle ?? TextStyle(color: Colors.black),
            obscureText: widget.obscureText ?? false,
            decoration: InputDecoration(
              labelText: widget.labelText,
              enabledBorder: widget.customEnabledBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                      color: widget.isError ? Colors.red : Colors.white,
                    ),
                  ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              focusedBorder: widget.customFocusedBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                      color: widget.isError ? Colors.red : Colors.white,
                    ),
                  ),
              suffixIcon: widget.suffixIcon,
              prefixIcon: widget.prefixIcon,
              errorStyle: TextStyle(color: Colors.white),
              fillColor: widget.fillColor ??
                  const Color.fromARGB(255, 184, 180, 180).withOpacity(0.2),
              filled: true,
              labelStyle: widget.labelStyle,
              border: InputBorder.none,
            ),
            maxLength: widget.maxLength,
            // keyboardType: widget.keyboardType,
          ),
        ],
      ),
    );
  }
}
