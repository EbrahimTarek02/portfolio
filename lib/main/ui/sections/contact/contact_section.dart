import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/helpers/app_colors.dart';
import 'package:portfolio/helpers/context_extension.dart';
import 'package:portfolio/helpers/widgets/default_button.dart';
import 'package:portfolio/helpers/widgets/default_text_form_field.dart';
import 'package:portfolio/main/provider/main_provider.dart';
import 'package:provider/provider.dart';

class ContactSection extends StatelessWidget {
  final MainProvider mainProvider;

  const ContactSection({super.key, required this.mainProvider});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: mainProvider.formKey,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          SizedBox(height: context.width > 800 ? context.height * 0.1 : context.height * 0.08),

          Row(
            children: [
              const Icon(
                Icons.email_outlined,
                color: AppColors.headerTextColor,
              ),

              Text(
                " Contact Me",

                style: GoogleFonts.aBeeZee(
                    color: AppColors.headerTextColor,
                    fontSize: context.width > 800 ? 24 : 18,
                    fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),

          SizedBox(height: context.height * 0.02),

          DefaultTextFormField(type: TextInputType.name, label: "Name", controller: mainProvider.nameController, fieldName: "name"),

          const SizedBox(height: 20),

          DefaultTextFormField(type: TextInputType.emailAddress, label: "Email", controller: mainProvider.emailController, fieldName: "email"),

          const SizedBox(height: 20),

          DefaultTextFormField(type: TextInputType.text, label: "Subject", controller: mainProvider.subjectController, fieldName: "subject"),

          const SizedBox(height: 20),

          DefaultTextFormField(type: TextInputType.multiline, label: "Message", controller: mainProvider.messageController, fieldName: "message"),

          const SizedBox(height: 20),

          Consumer<MainProvider>(
            builder: (context, consumerMainProvider, child) {
              if (consumerMainProvider.isSendingEmail) {
                return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor));
              }
              else {
                return DefaultButton(
                  onTap: () => consumerMainProvider.submitEmail(context),

                  buttonText: "Submit",
                );
              }
            },
          ),

          SizedBox(height: context.height * 0.05),

          Text(
            "Designed and Developed by Ebrahim Tarek & ChatGPT",

            style: GoogleFonts.aBeeZee(
                color: AppColors.headerTextColor,
                fontSize: 12,
                fontWeight: FontWeight.w400
            ),

            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
