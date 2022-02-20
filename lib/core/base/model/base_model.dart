abstract class BaseModel<T> {
  Map<String, dynamic> get toJson;
  BaseModel<T> fromJson(Map<String, dynamic> json);
}
