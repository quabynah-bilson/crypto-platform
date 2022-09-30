import 'package:auto_route/annotations.dart';
import 'package:mobile/features/dashboard/presentation/pages/dashboard.dart';
import 'package:mobile/features/shared/presentation/pages/welcome.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(page: WelcomePage, initial: true),
    AutoRoute(page: DashboardPage),
  ],
)
class $AppRouter {}
