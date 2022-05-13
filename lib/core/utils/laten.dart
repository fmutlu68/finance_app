class Laten<T> {
  late T? data;
  bool isDataEmpty = true;

  Laten();
  Laten.withValue(this.data);

  void setValue(T newData) {
    data = newData;
    isDataEmpty = false;
  }

  void clearData() {
    data = null;
    isDataEmpty = true;
  }
}
