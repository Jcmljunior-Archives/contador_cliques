import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

import '../features/counter/controller/counter_controller.dart';
import '../features/routes/controller/routes_controller.dart';
import 'views/home_view.dart';
import 'containers/home_container.dart';

final container = GetIt.instance;

Future<void> init() async {
  // * Rotas.
  container.registerFactory(() => const HomeView());

  // * Recipientes.
  container.registerFactory(() => HomeContainer());

  // * Controladores.
  container.registerLazySingleton(() => CounterController());
  container.registerFactory(
    () => RoutesController(
      routes: {
        '/': (BuildContext context) => container<HomeView>(),
      },
    ),
  );
}
