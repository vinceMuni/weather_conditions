import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String text;
  final bool isBold;
  final double size;
  final Color color;
  final TextAlign align;

  const AppText(this.text, {Key key, this.isBold = false, this.size = 16.0, this.color, this.align}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: GoogleFonts.lato(color: color, fontSize: size, fontWeight: isBold? FontWeight.bold : FontWeight.w500, ),
    );
  }
}