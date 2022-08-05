import '../entity/counter_entity.dart';

class CounterModel extends CounterEntity {
  CounterModel({
    required super.id,
    required super.value,
  });

  factory CounterModel.fromMap(Map<String, dynamic> json) {
    return CounterModel(
      id: json['id'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'value': value,
    };
  }

  @override
  String toString() {
    return 'Counter{id: $id, value: $value}';
  }
}
