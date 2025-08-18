import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final EdgeInsetsGeometry padding;
  final double borderRadius;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.fontSize = 18,
    this.padding = const EdgeInsets.symmetric(vertical: 18, horizontal: 120),
    this.borderRadius = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = TextButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: textColor,
      padding: padding,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
    );

    return TextButton(
      onPressed: onPressed,
      style: buttonStyle,
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          fontSize: fontSize,
          color: textColor,
          letterSpacing: 0.168,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
