import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../resources/colors_manager.dart';

class CustomText extends StatelessWidget {
  final double fontSize;
  final String title;
  const CustomText({super.key, this.fontSize = 60, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.spaceGrotesk(
        fontSize: fontSize,
        color: ColorsManager.white,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
