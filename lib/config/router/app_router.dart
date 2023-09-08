import 'package:go_router/go_router.dart';
import 'package:mi_diario_gym/presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: "/", routes: [
  GoRoute(
    path: "/",
    name: HomeScreen.name,
    builder: (context, state) => HomeScreen(),
  ),
  GoRoute(
    path: "/exercises-summary-screen",
    name: ExercisesSummaryScreen.name,
    builder: (context, state) => ExercisesSummaryScreen(),
  )
]);
