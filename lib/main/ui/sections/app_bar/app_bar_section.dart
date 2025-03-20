import 'package:flutter/material.dart';
import 'package:portfolio/helpers/context_extension.dart';
import 'package:portfolio/main/ui/sections/app_bar/desktop/app_bar_desktop_view.dart';
import 'package:portfolio/main/ui/sections/app_bar/mobile/app_bar_mobile_view.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (context.width > 800) {
          WidgetsBinding.instance.addPostFrameCallback((_){
            Scaffold.of(context).closeDrawer();
          });

          return const AppBarDesktopView();
        }
        else {
          return const AppBarMobileView();
        }
      },
    );
  }
}
