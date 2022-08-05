import '../container.dart';
import '../../features/counter/controller/counter_controller.dart';
import '../interfaces/home_container_interface.dart';
import '../../features/counter/interface/counter_controller_interface.dart';

class HomeContainer implements HomeContainerInterface {
  @override
  CounterControllerInterface counter = container<CounterController>();
}
