import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/helpers/app_colors.dart';
import 'package:portfolio/helpers/context_extension.dart';
import 'package:portfolio/main/data/models/experience_dm.dart';
import 'package:portfolio/main/provider/main_provider.dart';
import 'package:provider/provider.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      key: context.read<MainProvider>().experienceKey,

      padding: EdgeInsets.only(top: context.watch<MainProvider>().isExperienceVisible ? 0 : 400),

      duration: const Duration(seconds: 1),
      child: AnimatedOpacity(
        opacity: context.watch<MainProvider>().isExperienceVisible ? 1 : 0,

        duration: const Duration(milliseconds: 1500),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            SizedBox(height: context.width > 800 ? context.height * 0.1 : context.height * 0.08),

            Row(
              children: [
                const Icon(
                  Icons.work_outline,
                  color: AppColors.headerTextColor,
                ),

                Text(
                  " Experience",

                  style: GoogleFonts.aBeeZee(
                      color: AppColors.headerTextColor,
                      fontSize: context.width > 800 ? 24 : 18,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ],
            ),

            SizedBox(height: context.height * 0.01),

            Padding(
              padding: const EdgeInsetsDirectional.only(start: 12.0),

              child: Column(
                key: context.read<MainProvider>().experienceAnimationKey,

                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: _experienceBuilder(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _experienceBuilder(BuildContext context) {
    return ExperienceDm.experienceList.map((experience) {
      if (context.width > 600) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),

          child: Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.spaceBetween,
            runAlignment: WrapAlignment.end,

            children: [
              RichText(
                text: TextSpan(
                    text: "\u2022  ",

                    style: GoogleFonts.inter(
                        color: AppColors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w900
                    ),

                    children: [
                      TextSpan(
                        text: "${experience.role} at ",

                        style: GoogleFonts.inter(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),

                      TextSpan(
                        text: experience.companyName,

                        style: GoogleFonts.inter(
                            color: AppColors.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ]
                ),
              ),

              const SizedBox(width: 12),

              Text(
                experience.date,

                style: GoogleFonts.inter(
                    color: AppColors.headerTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                ),
              )
            ],
          ),
        );
      }
      else {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              RichText(
                text: TextSpan(
                    text: "\u2022  ",

                    style: GoogleFonts.inter(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w900
                    ),

                    children: [
                      TextSpan(
                        text: "${experience.role} at ",

                        style: GoogleFonts.inter(
                            color: AppColors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                        ),
                      ),

                      TextSpan(
                        text: experience.companyName,

                        style: GoogleFonts.inter(
                            color: AppColors.primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ]
                ),

                softWrap: true,
              ),

              const SizedBox(height: 4),

              Text(
                experience.date,

                style: GoogleFonts.inter(
                    color: AppColors.headerTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                ),
              )
            ],
          ),
        );
      }
    }).toList();
  }
}
