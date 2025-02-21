import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final Widget? suffixIcon;
  final double borderRadius;
  final double height;
  final double width;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function()? onTap;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.borderRadius = 8,
    this.validator,
    this.onSaved,
    this.suffixIcon,
    this.height = 56,
    this.width = double.infinity,
    this.controller,
    this.onChanged,
    this.onTap,
  });

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xFF687B88)),
      borderRadius: BorderRadius.circular(widget.borderRadius),
    );

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: widget.height,
        maxWidth: widget.width,
      ),
      child: TextFormField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: widget.hintText,
          // floatingLabelBehavior: FloatingLabelBehavior.always,
          hintStyle: TextStyle(color: Color(0xFF546978)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          suffixIcon: widget.suffixIcon,
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          disabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder.copyWith(
            borderSide: const BorderSide(color: Color(0xFF6C3293)),
          ),
        ),
        validator: widget.validator,
        onSaved: widget.onSaved,
        onTap: widget.onTap,
      ),
    );
  }
}
