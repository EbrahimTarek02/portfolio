import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/helpers/app_colors.dart';

class DefaultTextFormField extends StatelessWidget {
  final TextInputType type;
  final String label;
  final TextEditingController controller;
  final String fieldName;

  const DefaultTextFormField({
    super.key,
    required this.type,
    required this.label,
    required this.controller,
    required this.fieldName});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      controller: controller,
      minLines: fieldName == "message" ? 10 : null,
      maxLines: fieldName == "message" ? 100 : null,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Please, enter your $fieldName";
        }

        if (fieldName == "email") {
          final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

          if (!emailRegex.hasMatch(value ?? "")) {
            return "Please, enter a valid email";
          }
        }

        return null;
      },

      style: GoogleFonts.inter(color: AppColors.white, fontSize: 14),

      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.headerTextColor)
          ),

          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.headerTextColor)
          ),

          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.headerTextColor)
          ),

          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red)
          ),

          labelText: label,
          labelStyle: GoogleFonts.inter(color: AppColors.white, fontSize: 14),
          alignLabelWithHint: true,

          isDense: true,
      ),
    );
  }
}
