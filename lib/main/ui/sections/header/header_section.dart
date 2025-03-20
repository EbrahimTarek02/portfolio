import 'package:flutter/material.dart';
import 'package:portfolio/helpers/context_extension.dart';
import 'package:portfolio/main/ui/sections/header/desktop/header_desktop_view.dart';
import 'package:portfolio/main/ui/sections/header/mobile/header_mobile_view.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (context.width > 800) {
          return const HeaderDesktopView();
        }
        else {
          return const HeaderMobileView();
        }
      },
    );
  }
}
