import 'package:flutter/widgets.dart';
import 'package:portfolio/helpers/context_extension.dart';
import 'package:portfolio/main/data/repos/contact_repo.dart';

class MainProvider extends ChangeNotifier {
  ContactRepo contactRepo = ContactRepo();

  double scrollAnimationPadding = 150;

  ScrollController controller = ScrollController();

  bool isExperienceVisible = false;
  GlobalKey experienceKey = GlobalKey();
  GlobalKey experienceAnimationKey = GlobalKey();

  bool isProjectsVisible = false;
  GlobalKey projectsKey = GlobalKey();
  GlobalKey projectsAnimationKey = GlobalKey();

  bool isSkillsVisible = false;
  GlobalKey skillsKey = GlobalKey();
  GlobalKey skillsAnimationKey = GlobalKey();

  bool isAboutVisible = false;
  GlobalKey aboutKey = GlobalKey();
  GlobalKey aboutAnimationKey = GlobalKey();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  bool isSendingEmail = false;

  Future<void> submitEmail(BuildContext context) async{
    if (!formKey.currentState!.validate()) return;

    isSendingEmail = true;
    notifyListeners();

    bool isEmailSent = await contactRepo.sendEmail(
        context: context, name: nameController.text, email: emailController.text, subject: subjectController.text, message: messageController.text);

    if (isEmailSent) {
      nameController.clear();
      emailController.clear();
      subjectController.clear();
      messageController.clear();
    }

    isSendingEmail = false;
    notifyListeners();
  }

  void animateHeader() {
    scrollAnimationPadding = 0;
    notifyListeners();
  }

  void animateToExperienceSection(bool isDesktopView, BuildContext context) {
    Scrollable.ensureVisible(experienceKey.currentContext!, duration: const Duration(seconds: 1), curve: Curves.linear);
  }

  void animateExperienceSectionOnScroll(BuildContext context) {
    final RenderBox? renderBox = experienceKey.currentContext?.findRenderObject() as RenderBox?;

    if (renderBox != null) {
      final position = renderBox.localToGlobal(Offset.zero);
      final experienceSectionPosition = position.dy;

      if (experienceSectionPosition <= context.height && experienceSectionPosition >= 0) {
        if (!isExperienceVisible) {
          isExperienceVisible = true;
          notifyListeners();
        }
      }
    }
  }

  void animateToProjectsSection(bool isDesktopView, BuildContext context) {
    Scrollable.ensureVisible(projectsKey.currentContext!, duration: const Duration(seconds: 1), curve: Curves.linear);
  }

  void animateProjectSectionOnScroll(BuildContext context) {
    final RenderBox? renderBox = projectsAnimationKey.currentContext?.findRenderObject() as RenderBox?;

    if (renderBox != null) {
      final position = renderBox.localToGlobal(Offset.zero);
      final projectsSectionPosition = position.dy;

      if (projectsSectionPosition <= context.height && projectsSectionPosition >= 0) {
        if (!isProjectsVisible) {
          isProjectsVisible = true;
          notifyListeners();
        }
      }
    }
  }

  void animateToSkillsSection(bool isDesktopView, BuildContext context) {
    Scrollable.ensureVisible(skillsKey.currentContext!, duration: const Duration(seconds: 1), curve: Curves.linear);
  }

  void animateSkillsSectionOnScroll(BuildContext context) {
    final RenderBox? renderBox = skillsKey.currentContext?.findRenderObject() as RenderBox?;

    if (renderBox != null) {
      final position = renderBox.localToGlobal(Offset.zero);
      final skillsSectionPosition = position.dy;

      if (skillsSectionPosition <= context.height && skillsSectionPosition >= 0) {
        if (!isSkillsVisible) {
          isSkillsVisible = true;
          notifyListeners();
        }
      }
    }
  }

  void animateToAboutSection(bool isDesktopView, BuildContext context) {
    Scrollable.ensureVisible(aboutKey.currentContext!, duration: const Duration(seconds: 1), curve: Curves.linear);
  }

  void animateAboutSectionOnScroll(BuildContext context) {
    final RenderBox? renderBox = aboutKey.currentContext?.findRenderObject() as RenderBox?;

    if (renderBox != null) {
      final position = renderBox.localToGlobal(Offset.zero);
      final aboutSectionPosition = position.dy;

      if (aboutSectionPosition <= context.height && aboutSectionPosition >= 0) {
        if (!isAboutVisible) {
          isAboutVisible = true;
          notifyListeners();
        }
      }
    }
  }

  void animateToContactSection(bool isDesktopView, BuildContext context) {
    Scrollable.ensureVisible(formKey.currentContext!, duration: const Duration(seconds: 1), curve: Curves.linear);
  }
}