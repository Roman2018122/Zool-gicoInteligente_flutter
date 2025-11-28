import 'pages/home.dart';
import 'pages/animalesxHabitad.dart';
import 'pages/cal_alimentoDiario.dart';
import 'pages/favoritos_zoo.dart';
import 'pages/plan_alimentacion_se.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const WorkshopHomePage());
      case '/animalesHabitat':
        return MaterialPageRoute(builder: (_) => const AnimalesxHabitadPage());
      case '/calculadoraAlimento':
        return MaterialPageRoute(builder: (_) => const CalAlimentoDiarioPage());
      case '/favoritos':
        return MaterialPageRoute(builder: (_) => const FavoritosZooPage());
      case '/planAlimentacion':
        return MaterialPageRoute(builder: (_) => const PlanAlimentacionSemanalPage());
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
