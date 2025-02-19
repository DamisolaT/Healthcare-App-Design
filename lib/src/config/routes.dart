import 'package:flutter/cupertino.dart';
import 'package:healthcare_app/src/config/route_strings.dart';

import '../screens/views/organ_models_view/organ_models_screen.dart';
import '../screens/views/statistics_view/statistics_screen.dart';

class AppRouter {
  static final navKey = GlobalKey<NavigatorState>();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteStrings.base:
        return CupertinoPageRoute(builder: (_) => OrganModelsScreen());
      case AppRouteStrings.statisticsScreen:
        return CupertinoPageRoute(builder: (_) => StatisticsScreen());

      default:
        return CupertinoPageRoute(builder: (_) => OrganModelsScreen());
    }
  }
}
