import 'package:flutter/widgets.dart';

abstract class RoutesInterface {
  RoutesInterface(this.routes);

  final Map<String, WidgetBuilder> routes;

  Route? onGenerateRoute(RouteSettings settings);

  Iterable<MapEntry<String, WidgetBuilder>> filterRoute(String path);
}
