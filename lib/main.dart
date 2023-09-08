import 'package:flutter/material.dart';
import 'package:mi_diario_gym/config/router/app_router.dart';
import 'package:mi_diario_gym/presentation/screens/screens.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      theme: ThemeData(fontFamily: 'AltmannGrotesk'),
      debugShowCheckedModeBanner: false,
    );
  }
}
