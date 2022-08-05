import 'package:flutter/widgets.dart';

import 'shared/container.dart' as get_it;
import 'shared/bootstrap.dart';
import 'features/routes/controller/routes_controller.dart';

void main(List<String> args) {
  // ! Permite manipular Widgets antes da inicialização da aplicação. (Prevensão de erro)
  WidgetsFlutterBinding.ensureInitialized();

  // * Inialização do Container.
  get_it.init();

  // * Inicialização da aplicação.
  runApp(
    Bootstrap(
      routes: get_it.container<RoutesController>(),
    ),
  );
}
