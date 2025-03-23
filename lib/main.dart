import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return ScreenUtilInit(
      designSize: const Size(1920, 953),
      minTextAdapt: true,
      splitScreenMode: true,

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Ebrahim Tarek | Flutter Developer",

        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              systemNavigationBarColor: Colors.transparent,
              systemNavigationBarDividerColor: Colors.transparent
            )
          )
        ),

        home: const MainScreen(),
      ),
    );
  }
}
