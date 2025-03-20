import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/helpers/app_colors.dart';
import 'package:portfolio/helpers/context_extension.dart';
import 'package:portfolio/main/provider/main_provider.dart';
import 'package:provider/provider.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      key: context.read<MainProvider>().aboutKey,

      padding: EdgeInsets.only(top: context.watch<MainProvider>().isAboutVisible ? 0 : 400),

      duration: const Duration(seconds: 1),

      child: AnimatedOpacity(
        opacity: context.watch<MainProvider>().isAboutVisible ? 1 : 0,

        duration: const Duration(milliseconds: 1500),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            SizedBox(height: context.width > 800 ? context.height * 0.1 : context.height * 0.08),

            Row(
              children: [
                const Icon(
                  Icons.person_outline,
                  color: AppColors.headerTextColor,
                ),

                Text(
                  " About Me",

                  style: GoogleFonts.aBeeZee(
                      color: AppColors.headerTextColor,
                      fontSize: context.width > 800 ? 24 : 18,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ],
            ),

            SizedBox(height: context.height * 0.02),

            RichText(
              key: context.read<MainProvider>().aboutAnimationKey,

              text: TextSpan(
                  text: "I’m ",

                  style: GoogleFonts.inter(
                    fontSize: context.width > 800 ? 16 : 14,
                    color: AppColors.white,
                    letterSpacing: 2,
                    height: 1.5
                  ),

                  children: [
                    TextSpan(
                        text: "Ebrahim Tarek",

                        style: GoogleFonts.aBeeZee(
                            fontSize: context.width > 800 ? 16 : 14,
                            color: AppColors.primaryColor
                        )
                    ),

                    const TextSpan(text: ", a passionate "),

                    TextSpan(
                        text: "Flutter Developer",

                        style: GoogleFonts.aBeeZee(
                            fontSize: context.width > 800 ? 16 : 14,
                            color: AppColors.primaryColor
                        )
                    ),

                    const TextSpan(text: " from Egypt, currently 22 years old. I graduated from the "),

                    TextSpan(
                        text: "Faculty of Computer Science at Ain Shams University",

                        style: GoogleFonts.aBeeZee(
                            fontSize: context.width > 800 ? 16 : 14,
                            color: AppColors.primaryColor
                        )
                    ),

                    const TextSpan(text: " in 2024, and since then, I’ve been focused on growing my expertise in mobile app development with Flutter.\n\nDuring my "),

                    TextSpan(
                        text: "internship at ABS.AI Technologies",

                        style: GoogleFonts.aBeeZee(
                            fontSize: context.width > 800 ? 16 : 14,
                            color: AppColors.primaryColor
                        )
                    ),

                    const TextSpan(text: ", I gained valuable hands-on experience in developing and deploying apps, enhancing my problem-solving and coding abilities. Currently, I’m working as a "),

                    TextSpan(
                        text: "Flutter Developer at Zazome",

                        style: GoogleFonts.aBeeZee(
                            fontSize: context.width > 800 ? 16 : 14,
                            color: AppColors.primaryColor
                        )
                    ),

                    const TextSpan(text: " since November 2024, where I continue to build high-performance, cross-platform applications.\n\nI also completed an intensive "),

                    TextSpan(
                        text: "Flutter course at Route Academy",

                        style: GoogleFonts.aBeeZee(
                          fontSize: context.width > 800 ? 16 : 14,
                          color: AppColors.primaryColor
                        ),
                    ),

                    const TextSpan(text: ", which allowed me to refine my skills in Dart and Flutter development, enabling me to create clean, scalable, and efficient mobile solutions.\n\nI’m deeply passionate about creating seamless user experiences and constantly learning new technologies to stay ahead of industry trends. Feel free to explore my portfolio and see the projects I’ve worked on!\n\nLet's build something unforgettable! 🚀"),

                  ]
              ),

              softWrap: true,
            )
          ],
        ),
      ),
    );
  }
}
