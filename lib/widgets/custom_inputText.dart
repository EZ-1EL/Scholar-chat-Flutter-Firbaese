import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomFormInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final IconData? suffixIcon;
  final Color suffixIconColor;
  Function(String)? onChanged;
   CustomFormInputField({
     this.onChanged,
    Key? key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.suffixIconColor = Colors.greenAccent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        boxShadow: [
          const BoxShadow(
            color: Colors.black,
            blurRadius: 25,
            offset: Offset(0, 5),
            spreadRadius: -25,
          ),
        ],
      ),
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        validator:(data) {
          if (data!.isEmpty) {
            return 'Field is required';
          }
        } ,
        onChanged: onChanged,
        controller: controller,
        obscureText: obscureText,
        style: GoogleFonts.poppins(
          fontSize: 20,
          color: Colors.black,
          letterSpacing: 0.24,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xffA6B0BD)),
          fillColor: Colors.white,
          filled: true,
          suffixIcon: suffixIcon != null
              ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: FaIcon(suffixIcon, color: suffixIconColor),
          )
              : null,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(1)),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(1)),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
