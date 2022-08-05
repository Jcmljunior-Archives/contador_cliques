import 'package:flutter/widgets.dart';

import '../model/counter_model.dart';
import '../interface/counter_controller_interface.dart';

class CounterController extends ChangeNotifier
    implements CounterControllerInterface {
  @override
  List<CounterModel> values = [
    CounterModel(
      id: 1,
      value: 0,
    ),
    CounterModel(
      id: 2,
      value: 0,
    ),
  ];

  @override
  decrementById(int id) {
    final Iterable<CounterModel> counter =
        values.where((counter) => counter.id == id);

    if (counter.isNotEmpty) {
      counter.first.value--;
      notifyListeners();
    }
  }

  @override
  decrementByIndex(int index) {
    values.elementAt(index).value--;
    notifyListeners();
  }

  @override
  incrementById(int id) {
    final Iterable<CounterModel> counter =
        values.where((counter) => counter.id == id);

    if (counter.isNotEmpty) {
      counter.first.value++;
      notifyListeners();
    }
  }

  @override
  void incrementByIndex(int index) {
    values.elementAt(index).value++;
    notifyListeners();
  }

  @override
  void add(CounterModel counter) {
    values.add(counter);
    notifyListeners();
  }

  @override
  void remove(CounterModel counter) {
    values.remove(counter);
    notifyListeners();
  }
}
