import 'package:hive/hive.dart';

class HiveAdapterType<T> {
  final TypeAdapter<T> adapter;
  final int hiveTypeId;
  HiveAdapterType({
    required this.adapter,
    required this.hiveTypeId,
  });
}

typedef Name = Type Function();
