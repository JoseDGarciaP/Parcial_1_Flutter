import 'package:flutter/material.dart';
import 'package:parcial_1/config/router/router.dart';
import 'package:parcial_1/config/theme/app_theme.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectColor: 2).getThemeData(),
    );
  }
}