import 'package:auto_route/annotations.dart';
import 'package:mobile/features/shared/presentation/pages/welcome.dart';

@AdaptiveAutoRouter(
  routes: [
    AutoRoute(page: WelcomePage, initial: true),
  ],
)
class $AppRouter {}
