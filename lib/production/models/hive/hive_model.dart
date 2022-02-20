import 'package:hive_flutter/adapters.dart';

part 'hive_model.g.dart';

@HiveType(typeId: 0, adapterName: "Test")
class HiveModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
}
