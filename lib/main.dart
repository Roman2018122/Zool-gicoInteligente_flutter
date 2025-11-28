import 'package:flutter/material.dart';
import 'app_router.dart';

void main() {
  runApp(const ZooInteligenteApp());
}

class ZooInteligenteApp extends StatelessWidget {
  const ZooInteligenteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zoo Inteligente',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: '/',
    );
  }
}