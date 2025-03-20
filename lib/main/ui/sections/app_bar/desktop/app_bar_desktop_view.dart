import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/helpers/app_colors.dart';
import 'package:portfolio/main/provider/main_provider.dart';
import 'package:provider/provider.dart';

class AppBarDesktopView extends StatelessWidget {
  const AppBarDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Text(
          "Ebrahim Tarek",
          style: GoogleFonts.aBeeZee(
              color: AppColors.headerTextColor,
              fontSize: 28,
              fontWeight: FontWeight.bold
          ),
        ),

        Row(
          children: [
            textButtonWidget(title: "Experience", onTap: (){
              context.read<MainProvider>().animateToExperienceSection(true, context);
            }),
            textButtonWidget(title: "Projects", onTap: (){
              context.read<MainProvider>().animateToProjectsSection(true, context);
            }),
            textButtonWidget(title: "Skills", onTap: (){
              context.read<MainProvider>().animateToSkillsSection(true, context);
            }),
            textButtonWidget(title: "About", onTap: (){
              context.read<MainProvider>().animateToAboutSection(true, context);
            }),
            textButtonWidget(title: "Contact", onTap: (){
              context.read<MainProvider>().animateToContactSection(true, context);
            }),
          ],
        )
      ],
    );
  }
}


Widget textButtonWidget({
  required String title,
  required Function onTap
}) {
  return TextButton(
      onPressed: () => onTap(),

      child: Text(
        title,

        style: GoogleFonts.inter(color: AppColors.headerTextColor, fontSize: 16),
      )
  );
}