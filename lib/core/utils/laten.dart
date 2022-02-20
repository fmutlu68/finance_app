class Laten<T> {
  late T? data;
  bool isDataEmpty = true;

  void setValue(T newData) {
    data = newData;
    isDataEmpty = false;
  }

  void clearData() {
    data = null;
    isDataEmpty = true;
  }
}
