import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/helpers/app_colors.dart';

class DefaultButton extends StatelessWidget {
  final Function onTap;
  final Color? backgroundColor;
  final String? buttonText;
  final Widget? child;
  final EdgeInsets? padding;

  const DefaultButton({
    super.key,
    required this.onTap,
    this.backgroundColor,
    this.buttonText,
    this.padding,
    this.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => onTap(),

        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
          ),

          tapTargetSize: padding != null ? MaterialTapTargetSize.shrinkWrap : null,
          minimumSize: padding != null ? Size.zero : null,
          padding: padding
        ),

        child: buttonText != null
            ? Text(
          buttonText!,

          style: GoogleFonts.openSans(
              fontWeight: FontWeight.bold,
              color: AppColors.backgroundColor
          ),
        )
            : child
    );
  }
}
