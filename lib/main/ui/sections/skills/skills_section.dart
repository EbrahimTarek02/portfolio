import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/helpers/app_colors.dart';
import 'package:portfolio/helpers/context_extension.dart';
import 'package:portfolio/main/data/models/skills_dm.dart';
import 'package:portfolio/main/provider/main_provider.dart';
import 'package:provider/provider.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      key: context.read<MainProvider>().skillsKey,

      padding: EdgeInsets.only(top: context.watch<MainProvider>().isSkillsVisible ? 0 : 400),

      duration: const Duration(seconds: 1),

      child: AnimatedOpacity(
        opacity: context.watch<MainProvider>().isSkillsVisible ? 1 : 0,

        duration: const Duration(milliseconds: 1500),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            SizedBox(height: context.width > 800 ? context.height * 0.1 : context.height * 0.08),

            Row(
              children: [
                const Icon(
                  Icons.electric_bolt_outlined,
                  color: AppColors.headerTextColor,
                ),

                Text(
                  " Skills",

                  style: GoogleFonts.aBeeZee(
                      color: AppColors.headerTextColor,
                      fontSize: context.width > 800 ? 24 : 18,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ],
            ),

            SizedBox(height: context.height * 0.02),

            Wrap(
              key: context.read<MainProvider>().skillsAnimationKey,

              direction: Axis.horizontal,

              spacing: 12,
              runSpacing: 12,

              children: skillsBuilder(),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> skillsBuilder() {
    return SkillsDm.skills.map((skill) {
      return Container(
        decoration: BoxDecoration(
          color: AppColors.secondaryBackgroundColor,
          borderRadius: BorderRadius.circular(12)
        ),

        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),

        child: Text(
          skill,

          style: GoogleFonts.inter(
            color: AppColors.white,
            fontWeight: FontWeight.w500
          ),
        ),
      );
    }).toList();
  }
}
