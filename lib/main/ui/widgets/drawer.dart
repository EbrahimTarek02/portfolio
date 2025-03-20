import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/helpers/app_colors.dart';
import 'package:portfolio/main/provider/main_provider.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.secondaryBackgroundColor,

      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),

        children: [
          Text(
            "Sections",

            style: GoogleFonts.aBeeZee(
                color: AppColors.headerTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),

          const Divider(color: AppColors.headerTextColor),

          drawerTextButton(
              title: "Experience",
              icon: Icons.work_outline,
              onTap: (){
                context.read<MainProvider>().animateToExperienceSection(false, context);
                Scaffold.of(context).closeDrawer();
              }),

          drawerTextButton(
              title: "Projects",
              icon: Icons.folder_outlined,
              onTap: (){
                context.read<MainProvider>().animateToProjectsSection(false, context);
                Scaffold.of(context).closeDrawer();
              }),

          drawerTextButton(
              title: "Skills",
              icon: Icons.electric_bolt_outlined,
              onTap: (){
                context.read<MainProvider>().animateToSkillsSection(false, context);
                Scaffold.of(context).closeDrawer();
              }),

          drawerTextButton(
              title: "About",
              icon: Icons.person_outline,
              onTap: (){
                context.read<MainProvider>().animateToAboutSection(false, context);
                Scaffold.of(context).closeDrawer();
              }),

          drawerTextButton(
              title: "Contact",
              icon: Icons.email_outlined,
              onTap: (){
                context.read<MainProvider>().animateToContactSection(false, context);
                Scaffold.of(context).closeDrawer();
              }),
        ],
      ),
    );
  }
}


Widget drawerTextButton({required String title, required IconData icon, required Function onTap}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0),

    child: InkWell(
      onTap: () => onTap(),

      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.white,
          ),

          const SizedBox(width: 12),

          Text(
            title,

            style: GoogleFonts.inter(
              color: AppColors.white,
            ),

            textAlign: TextAlign.start,
          ),
        ],
      ),
    ),
  );
}