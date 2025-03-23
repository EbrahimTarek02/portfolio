import 'package:flutter/material.dart';
import 'package:portfolio/helpers/app_colors.dart';
import 'package:portfolio/helpers/context_extension.dart';
import 'package:portfolio/main/provider/main_provider.dart';
import 'package:portfolio/main/ui/sections/about_me/about_me_section.dart';
import 'package:portfolio/main/ui/sections/app_bar/app_bar_section.dart';
import 'package:portfolio/main/ui/sections/contact/contact_section.dart';
import 'package:portfolio/main/ui/sections/experience/experience_section.dart';
import 'package:portfolio/main/ui/sections/header/header_section.dart';
import 'package:portfolio/main/ui/sections/projects/projects_section.dart';
import 'package:portfolio/main/ui/sections/skills/skills_section.dart';
import 'package:portfolio/main/ui/widgets/drawer.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen ({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late final MainProvider mainProvider;

  @override
  void initState() {
    super.initState();

    mainProvider = context.read<MainProvider>();

    mainProvider.controller.addListener(_checkWidgetPosition);

    Future.delayed(const Duration(seconds: 0), () {
      mainProvider.animateHeader();

      if (context.width > 800) {
        mainProvider.isExperienceVisible = true;
      }
    });
  }

  void _checkWidgetPosition() {
    mainProvider.animateExperienceSectionOnScroll(context);
    mainProvider.animateProjectSectionOnScroll(context);
    mainProvider.animateSkillsSectionOnScroll(context);
    mainProvider.animateAboutSectionOnScroll(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            AppColors.backgroundColor,
            AppColors.backgroundColor,
            AppColors.backgroundColor,
            AppColors.backgroundColor.withOpacity(0.9),
            AppColors.backgroundColor.withOpacity(0.9),
            AppColors.backgroundColor.withOpacity(0.8),
            AppColors.backgroundColor.withOpacity(0.8),
            AppColors.backgroundColor.withOpacity(0.8),
            AppColors.backgroundColor.withOpacity(0.9),
            AppColors.backgroundColor.withOpacity(0.9),
            AppColors.backgroundColor,
            AppColors.backgroundColor,
            AppColors.backgroundColor,
          ],
        ),
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,

        drawer: const MyDrawer(),

        body: SafeArea(
          child: SingleChildScrollView(
            controller: mainProvider.controller,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),

            child: Consumer<MainProvider>(
              builder: (context, consumerMainProvider, _) {
                return AnimatedPadding(
                  duration: const Duration(milliseconds: 1500),

                  padding: EdgeInsets.only(top: consumerMainProvider.isHeaderVisible ? 0 : 150),

                  child: AnimatedOpacity(
                    duration: const Duration(seconds: 2),

                    opacity: consumerMainProvider.isHeaderVisible ? 1 : 0,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,

                      children: [
                        const AppBarSection(),

                        const HeaderSection(),

                        const ExperienceSection(),

                        const ProjectsSection(),

                        const SkillsSection(),

                        const AboutMeSection(),

                        ContactSection(mainProvider: consumerMainProvider),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
