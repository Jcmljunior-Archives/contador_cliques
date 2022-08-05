import '../model/counter_model.dart';

abstract class CounterControllerInterface {
  late List<CounterModel> values;

  // * Incrementa o contador relacionado ao id.
  void incrementById(int index);

  void incrementByIndex(int index);

  // * Decrementa o contador relacionado ao id.
  void decrementById(int index);

  void decrementByIndex(int index);

  // * Adiciona um novo contador.
  void add(CounterModel counter);

  // * Remove um contador.
  void remove(CounterModel counter);
}
