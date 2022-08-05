import 'package:flutter/material.dart';

import '../interface/routes_interface.dart';

class RoutesController implements RoutesInterface {
  const RoutesController({
    required this.routes,
  });

  @override
  final Map<String, WidgetBuilder> routes;

  @override
  Route? onGenerateRoute(RouteSettings settings) {
    final routes = filterRoute(settings.name as String);

    if (routes.isNotEmpty) {
      return MaterialPageRoute(builder: routes.first.value);
    }

    return null;
  }

  @override
  Iterable<MapEntry<String, WidgetBuilder>> filterRoute(String path) {
    return routes.entries.where((route) => route.key.contains(path));
  }
}
