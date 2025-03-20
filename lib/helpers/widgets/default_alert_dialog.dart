import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/helpers/app_colors.dart';

class DefaultAlertDialog extends StatelessWidget {
  final BuildContext context;
  final String title;
  final String description;
  final Function? callback;
  final String? buttonTitle;

  const DefaultAlertDialog({
    super.key,
    required this.context,
    required this.title,
    required this.description,
    this.callback,
    this.buttonTitle
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.secondaryBackgroundColor,
      surfaceTintColor: Colors.transparent,

      title: Text(
        title,
        softWrap: true,
        style: GoogleFonts.openSans(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),

      content: Text(
        description,
        softWrap: true,
        style: GoogleFonts.openSans(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
      ),

      actions: <Widget>[
        if(buttonTitle != null && callback != null) TextButton(
          onPressed: () => Navigator.pop(context),

          child: Text(
            "Cancel",
            softWrap: true,
            style: GoogleFonts.openSans(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),

        TextButton(
          onPressed: () {
            callback != null ? callback!() : Navigator.pop(context);
          },

          child: Text(
            buttonTitle ?? "OK",
            softWrap: true,
            style: GoogleFonts.openSans(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
