extension DoubleStrParserExtension on String {
  double parseSTR() {
    try {
      return double.parse(
          replaceAll(".", "").replaceAll(",", ".").replaceAll("%", ""));
    } catch (e) {
      print("$e $this");
      return 0;
    }
  }

  double parseSTRContainsComma() {
    return double.parse(replaceAll("\$", "")
        .replaceAll(".", "")
        .replaceAll(",", ".")
        .replaceAll("%", ""));
  }

  bool operator(String other) {
    return other.isEmpty;
  }
}
