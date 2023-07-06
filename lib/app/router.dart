import 'package:go_router/go_router.dart';
import 'package:theme_accent_color_switch/pages/home_page.dart';

GoRouter buildRouter() {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
