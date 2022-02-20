import 'package:finance_app/core/features/local_cache/hive/models/hive_adapter_type.dart';
import 'package:hive/hive.dart';

class HiveInitParameters {
  final bool? initForDart;
  final bool? initForFlutter;
  final String? pathForDart;
  final AdapterRegister adapterRegister;
  HiveInitParameters({
    required this.adapterRegister,
    this.initForDart,
    this.pathForDart,
    this.initForFlutter,
  })  : assert(initForDart != null || initForFlutter != null,
            "You must select an initializing mode for hive"),
        assert(initForDart != initForFlutter,
            "You must select only an initializing mode for hive"),
        assert(initForDart != null ? pathForDart != null : true,
            "You must give a path");
}

typedef AdapterRegister = void Function(
    AdapterRegisterMethod method, HiveAdapterType adapter);
typedef AdapterRegisterMethod = void Function<T>(
  TypeAdapter<T> adapter, {
  bool internal,
  bool override,
});
