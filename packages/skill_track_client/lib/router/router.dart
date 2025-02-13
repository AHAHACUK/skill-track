import 'package:go_router/go_router.dart';
import 'package:skill_track_client/features/home_page/presentation/pages/home_page.dart';
import 'package:skill_track_client/router/routes/home_route.dart';

final appRouter = GoRouter(
  initialLocation: '/${HomeRoute.path}',
  routes: [
    GoRoute(
      path: '/${HomeRoute.path}',
      builder: (_, __) {
        return const HomePage();
      },
    )
  ],
);
