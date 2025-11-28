import 'package:flutter/material.dart';
import 'home_page.dart';
import 'animales_habitat_page.dart';
import 'calculadora_alimento_page.dart';
import 'favoritos_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());

      case '/animalesHabitat':
        return MaterialPageRoute(builder: (_) => const AnimalesHabitatPage());

      case '/calculadoraAlimento':
        return MaterialPageRoute(builder: (_) => const CalculadoraAlimentoPage());

      case '/favoritos':
        return MaterialPageRoute(builder: (_) => const FavoritosPage());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                "Ruta no encontrada: ${settings.name}",
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
        );
    }
  }
}
