import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Label extends StatelessWidget {
  final String text;
  final String? fontName; // Allow customization of font name
  final FontWeight? fontWeight; // Allow customization of fontWeight
  final double? fontSize; // Allow customization of fontSize
  final Color? color;
  final FontStyle? fontStyle; // Allow customization of text color
  final TextAlign? textAlign; // Allow customization of text color

  const Label(
      {super.key,
      required this.text,
      this.fontName,
      this.fontWeight,
      this.fontSize,
      this.color,
      this.fontStyle,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      fontWeight: fontWeight ?? FontWeight.w500, //default fontweight is 500
      fontSize: fontSize ?? 14, //default value is 14
      color: color ?? Colors.black,
      fontStyle: fontStyle ?? FontStyle.normal,
    );

    if (fontName != null) {
      // this is to check if there is a fontName or not
      return Text(
        text,
        softWrap: true,
        textAlign: textAlign ?? TextAlign.start,
        style: GoogleFonts.getFont(
          fontName!,
          textStyle: textStyle,
        ),
      );
    } else {
      return Text(
        softWrap: true,
        text,
        style: textStyle,
      );
    }
  }
}
