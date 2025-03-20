import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/helpers/app_assets.dart';
import 'package:portfolio/helpers/app_colors.dart';
import 'package:portfolio/helpers/context_extension.dart';
import 'package:portfolio/helpers/widgets/default_alert_dialog.dart';
import 'package:portfolio/helpers/widgets/default_button.dart';
import 'package:portfolio/helpers/widgets/default_image.dart';
import 'package:portfolio/main/data/models/project_dm.dart';
import 'package:portfolio/main/provider/main_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      key: context.read<MainProvider>().projectsKey,

      padding: EdgeInsets.only(top: context.watch<MainProvider>().isProjectsVisible ? 0 : 400),

      duration: const Duration(seconds: 1),

      child: AnimatedOpacity(
        opacity: context.watch<MainProvider>().isProjectsVisible ? 1 : 0,

        duration: const Duration(milliseconds: 1500),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            SizedBox(height: context.height * 0.1),

            Row(
              key: context.read<MainProvider>().projectsAnimationKey,

              children: [
                const Icon(
                  Icons.folder_outlined,
                  color: AppColors.white,
                ),

                Text(
                  " Projects",

                  style: GoogleFonts.aBeeZee(
                      color: AppColors.headerTextColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w500
                  ),
                )
              ],
            ),

            const SizedBox(height: 30),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: context.width > 1400 ? 3 : context.width > 900 ? 2 : 1,

              crossAxisSpacing: context.width * 0.03,
              mainAxisSpacing: context.height * 0.02,

              childAspectRatio: context.width > 900 ? 1 : context.width > 600 ? 4 / 3 : 3 / 4,

              children: _projectsBuilder(context),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _projectsBuilder(BuildContext context) {
    return ProjectDm.projects.map((project) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.headerTextColor)
        ),

        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Expanded(
              child: Container(
                clipBehavior: Clip.hardEdge,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.secondaryBackgroundColor,

                    image: DecorationImage(
                        image: AssetImage(project.image),
                        fit: BoxFit.contain
                    )
                ),
              ),
            ),

            const SizedBox(height: 12),

            Text(
              project.title,

              style: GoogleFonts.inter(
                  color: AppColors.headerTextColor,
                  fontSize: context.width > 1200 ? 16 : 14,
                  fontWeight: FontWeight.w500
              ),
              maxLines: 1,
            ),

            const SizedBox(height: 8),

            Wrap(
              direction: Axis.horizontal,
              spacing: 8,
              runSpacing: 8,

              children: projectTechnologiesBuilder(project.technologies, context),
            ),

            const SizedBox(height: 8),

            Text(
              project.description,

              style: GoogleFonts.inter(
                  color: AppColors.headerTextColor,
                  fontSize: context.width > 1200 ? 14 : 12,
                  fontWeight: FontWeight.w400
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 8),

            Column(
              children: [
                if (project.github?.isNotEmpty ?? false) Padding(
                  padding: EdgeInsets.symmetric(vertical: context.width > 600 ? 8.0 : 2),

                  child: DefaultButton(
                    onTap: () {
                      try {
                        launchUrl(Uri.parse(project.github!));
                      }
                      catch (_) {
                        showDialog(context: context, builder: (context) => DefaultAlertDialog(
                          context: context,
                          title: "Error",
                          description: "Something went wrong. Please, try again later.",
                        ));
                      }
                    },

                    backgroundColor: AppColors.secondaryBackgroundColor,
                    padding: context.width < 600 ? const EdgeInsets.symmetric(vertical: 4) : null,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text(
                          "View on Github  ",

                          style: GoogleFonts.inter(
                              color: AppColors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w300
                          ),
                        ),

                        const DefaultImage(image: AppAssets.githubIcon)
                      ],
                    ),
                  ),
                ),

                if (project.googlePlay?.isNotEmpty ?? false) Padding(
                  padding: EdgeInsets.symmetric(vertical: context.width > 600 ? 8.0 : 2),

                  child: DefaultButton(
                    onTap: () {
                      try {
                        launchUrl(Uri.parse(project.googlePlay!));
                      }
                      catch (_) {
                        showDialog(context: context, builder: (context) => DefaultAlertDialog(
                          context: context,
                          title: "Error",
                          description: "Something went wrong. Please, try again later.",
                        ));
                      }
                    },

                    backgroundColor: AppColors.secondaryBackgroundColor,
                    padding: context.width < 600 ? const EdgeInsets.symmetric(vertical: 8) : null,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text(
                          "View on Google Play  ",

                          style: GoogleFonts.inter(
                              color: AppColors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w300
                          ),
                        ),

                        const DefaultImage(image: AppAssets.googlePlayIcon, height: 16)
                      ],
                    ),
                  ),
                ),

                if (project.appStore?.isNotEmpty ?? false) Padding(
                  padding: EdgeInsets.symmetric(vertical: context.width > 600 ? 8.0 : 2),

                  child: DefaultButton(
                    onTap: () {
                      try {
                        launchUrl(Uri.parse(project.appStore!));
                      }
                      catch (_) {
                        showDialog(context: context, builder: (context) => DefaultAlertDialog(
                          context: context,
                          title: "Error",
                          description: "Something went wrong. Please, try again later.",
                        ));
                      }
                    },

                    backgroundColor: AppColors.secondaryBackgroundColor,
                    padding: context.width < 600 ? const EdgeInsets.symmetric(vertical: 8) : null,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text(
                          "View on App Store  ",

                          style: GoogleFonts.inter(
                              color: AppColors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w300
                          ),
                        ),

                        const DefaultImage(image: AppAssets.appStoreIcon, height: 16)
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }).toList();
  }

  List<Widget> projectTechnologiesBuilder(List<String> technologies, BuildContext context) {
    return technologies.map((technology) {
      return Container(
        decoration: BoxDecoration(
            color: AppColors.secondaryBackgroundColor,
            borderRadius: BorderRadius.circular(12)
        ),

        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),

        child: Text(
          technology,

          style: GoogleFonts.inter(
              color: AppColors.white,
              fontSize: 12,
              fontWeight: FontWeight.w300
          ),
        ),
      );
    }).toList();
  }
}
