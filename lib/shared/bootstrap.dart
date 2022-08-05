import 'package:flutter/material.dart';

import '../features/routes/interface/routes_interface.dart';

class Bootstrap extends StatelessWidget {
  const Bootstrap({
    required this.routes,
    super.key,
  });

  final RoutesInterface routes;

  @override
  MaterialApp build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color.fromRGBO(129, 161, 193, 1),
        brightness: Brightness.light,
      ),
      initialRoute: '/',
      onGenerateRoute: routes.onGenerateRoute,
    );
  }
}
