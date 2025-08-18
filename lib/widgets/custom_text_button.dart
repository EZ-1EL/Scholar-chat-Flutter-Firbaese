import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextButtonRow extends StatelessWidget {
  final String normalText;
  final String actionText;
  final VoidCallback onTap;
  final Color normalTextColor;
  final Color actionTextColor;
  final double fontSize;

  const CustomTextButtonRow({
    Key? key,
    required this.normalText,
    required this.actionText,
    required this.onTap,
    this.normalTextColor = Colors.greenAccent,
    this.actionTextColor = Colors.black,
    this.fontSize = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          normalText,
          style: GoogleFonts.montserrat(fontSize: fontSize, color: normalTextColor),
        ),
        InkWell(
          child: Text(
            actionText,
            style: GoogleFonts.montserrat(fontSize: fontSize, fontWeight: FontWeight.bold, color: actionTextColor),
          ),
          onTap: onTap,
        ),
      ],
    );
  }
}
