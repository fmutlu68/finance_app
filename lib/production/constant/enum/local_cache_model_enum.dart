enum LocalCacheModel {
  hiveModel(0, adapterName: "Test"),
  networkOptions(1);

  final int typeId;
  final String? adapterName;
  const LocalCacheModel(this.typeId, {this.adapterName});
}
