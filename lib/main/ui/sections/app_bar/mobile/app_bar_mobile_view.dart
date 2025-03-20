import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/helpers/app_colors.dart';

class AppBarMobileView extends StatelessWidget {
  const AppBarMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,

      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text(
              "Ebrahim Tarek",
              style: GoogleFonts.aBeeZee(
                  color: AppColors.headerTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),

            IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },

                icon: const Icon(
                  Icons.menu,
                  color: AppColors.white,
                )
            ),
          ],
        )
      ],
    );
  }
}