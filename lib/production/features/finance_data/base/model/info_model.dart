abstract class InfoModel {
  String name;
  String info;
  String path;
  String? nameToShow;
  String? graphSymbol;
  bool? hideName;

  InfoModel(
      {required this.name,
      required this.info,
      required this.path,
      this.nameToShow,
      this.hideName,
      this.graphSymbol});
}
