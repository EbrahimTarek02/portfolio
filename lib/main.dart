import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/main/provider/main_provider.dart';
import 'package:portfolio/main/ui/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<MainProvider>(
      create: (context) => MainProvider(),
      child: const MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(1920, 953),
      minTextAdapt: true,
      splitScreenMode: true,

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Ebrahim Tarek | Flutter Developer",

        home: MainScreen(),
      ),
    );
  }
}


/// sections
/// 1- app bar => figma                                                                                           (Done)
/// 2- header => figma & live                                                                                     (Done)
/// 3- Projects => 3 will be grid_view with view on (github & google_play & app_store) buttons                    (Done)
/// 4- Experience => 3 for web & figma for mobile                                                                 (Done)
/// 5- Skills => Grid view contains containers has the title of the skill (something like capabilities in figma)  (Done)
/// 6- About => 3 without the image                                                                               (Done)
/// 7- Contact => 3                                                                                               (Done)
