import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/helpers/app_assets.dart';
import 'package:portfolio/helpers/app_colors.dart';
import 'package:portfolio/helpers/context_extension.dart';
import 'package:portfolio/helpers/widgets/default_alert_dialog.dart';
import 'package:portfolio/helpers/widgets/default_button.dart';
import 'package:portfolio/helpers/widgets/default_image.dart';
import 'package:url_launcher/url_launcher.dart';

class HeaderDesktopView extends StatelessWidget {
  const HeaderDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.height * 0.08),

        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    "Hey, I'm Ebrahim 👋🏻",

                    style: GoogleFonts.aBeeZee(
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "Flutter",

                    style: GoogleFonts.aBeeZee(
                      color: AppColors.primaryColor,
                      fontSize: 44,
                      fontWeight: FontWeight.bold,
                      height: 1
                    ),
                  ),

                  Text(
                    "Developer",

                    style: GoogleFonts.aBeeZee(
                      color: AppColors.primaryColor,
                      fontSize: 44,
                      fontWeight: FontWeight.bold,
                      height: 1
                    ),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    "I'm a Flutter developer based in Egypt, I'll help you build beautiful mobile apps for android and IOS your users will love.",

                    style: GoogleFonts.inter(
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400
                    ),
                  ),

                  const SizedBox(height: 32),

                  Row(
                    children: [
                      DefaultButton(
                        onTap: () {
                          try {
                            launchUrl(Uri.parse("https://flowcv.com/resume/gdb16s92ld"), mode: LaunchMode.externalApplication);
                          }
                          catch (_) {
                            showDialog(context: context, builder: (context) => DefaultAlertDialog(
                              context: context,
                              title: "Error",
                              description: "Something went wrong. Please, try again later.",
                            ));
                          }
                        },

                        child: Row(
                          children: [
                            const Icon(
                              Icons.download,
                              color: AppColors.black,
                              size: 18,
                            ),

                            Text(
                              " Download CV",

                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold,
                                color: AppColors.backgroundColor
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 10),

                      IconButton(
                          onPressed: () {
                            try {
                              launchUrl(Uri.parse("mailto:ebrahimtarek2002@gmail.com"), mode: LaunchMode.externalApplication);
                            }
                            catch (_) {
                              showDialog(context: context, builder: (context) => DefaultAlertDialog(
                                context: context,
                                title: "Error",
                                description: "Something went wrong. Please, try again later.",
                              ));
                            }
                          },

                          style: ElevatedButton.styleFrom(backgroundColor: AppColors.secondaryBackgroundColor),

                          icon: const Icon(Icons.email, color: AppColors.primaryColor, size: 20)
                      ),

                      const SizedBox(width: 10),

                      IconButton(
                          onPressed: () {
                            try {
                              launchUrl(Uri.parse("https://wa.me/+201122935123"), mode: LaunchMode.externalApplication);
                            }
                            catch (_) {
                              showDialog(context: context, builder: (context) => DefaultAlertDialog(
                                context: context,
                                title: "Error",
                                description: "Something went wrong. Please, try again later.",
                              ));
                            }
                          },

                          style: ElevatedButton.styleFrom(backgroundColor: AppColors.secondaryBackgroundColor),

                          icon: const DefaultImage(image: AppAssets.whatsappIcon, iconColor: AppColors.primaryColor, height: 20)
                      ),

                      const SizedBox(width: 10),

                      IconButton(
                          onPressed: () {
                            try {
                              launchUrl(Uri.parse("tel:+201122935123"));
                            }
                            catch (_) {
                              showDialog(context: context, builder: (context) => DefaultAlertDialog(
                                context: context,
                                title: "Error",
                                description: "Something went wrong. Please, try again later.",
                              ));
                            }
                          },

                          style: ElevatedButton.styleFrom(backgroundColor: AppColors.secondaryBackgroundColor),

                          icon: const Icon(Icons.call, color: AppColors.primaryColor, size: 20)
                      ),

                      const SizedBox(width: 10),

                      IconButton(
                          onPressed: () {
                            try {
                              launchUrl(Uri.parse("https://www.linkedin.com/in/ebrahim-tarek-00349a21b"), mode: LaunchMode.externalApplication);
                            }
                            catch (_) {
                              showDialog(context: context, builder: (context) => DefaultAlertDialog(
                                context: context,
                                title: "Error",
                                description: "Something went wrong. Please, try again later.",
                              ));
                            }
                          },

                          style: ElevatedButton.styleFrom(backgroundColor: AppColors.secondaryBackgroundColor),

                          icon: const DefaultImage(image: AppAssets.linkedInIcon)
                      ),

                      const SizedBox(width: 10),

                      IconButton(
                        onPressed: (){
                          try {
                            launchUrl(Uri.parse("https://github.com/EbrahimTarek02"), mode: LaunchMode.externalApplication);
                          }
                          catch (_) {
                            showDialog(context: context, builder: (context) => DefaultAlertDialog(
                              context: context,
                              title: "Error",
                              description: "Something went wrong. Please, try again later.",
                            ));
                          }
                        },

                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.secondaryBackgroundColor),

                        icon: const DefaultImage(image: AppAssets.githubIcon)
                      ),
                    ],
                  )
                ],
              ),
            ),

            Container(
              height: context.height * 0.5,

              margin: REdgeInsets.symmetric(horizontal: context.width * 0.1),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),

              clipBehavior: Clip.hardEdge,

              child: Image.asset(
                AppAssets.headerImage,
                fit: BoxFit.fill,
              ),
            )
          ],
        ),
      ],
    );
  }
}
