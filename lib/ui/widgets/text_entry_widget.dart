import 'package:flutter/material.dart';

class TextEntryWidget extends StatelessWidget {
  const TextEntryWidget({
    Key key,
    @required this.controller,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.red,
    this.obscureText = false,
    this.labelText,
    this.suffixIcon,
    this.suffixColor = Colors.red,
    this.onChanged,
  }) : super(key: key);

  final TextEditingController controller;
  final Color backgroundColor;
  final Color borderColor;
  final bool obscureText;
  final String labelText;
  final IconData suffixIcon;
  final Color suffixColor;

  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
        ),
        color: backgroundColor,
      ),
      padding: EdgeInsets.only(left: 15),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        onChanged: onChanged ?? () {},
        decoration: InputDecoration(
          labelText: labelText,
          border: InputBorder.none,
          suffixIcon: Icon(
            suffixIcon,
            color: suffixColor,
          ),
        ),
      ),
    );
  }
}
