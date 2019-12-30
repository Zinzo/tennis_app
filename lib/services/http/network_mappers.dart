import 'dart:convert';

abstract class RequestMapable {
  Map<String, dynamic> toJson();
}

abstract class Mapable {
  factory Mapable(Mapable type, String data) {
    if (type is BaseMapable) {
      Map<String, dynamic> mappingData = json.decode(data);
      return type.fromJson(mappingData);
    } else if (type is ListMapable) {
      Iterable iterableData = json.decode(data);
      return type.fromJsonList(iterableData);
    }

    return null;
  }
}

abstract class BaseMapable<T> implements Mapable {
  Mapable fromJson(Map<String, dynamic> json);
}

abstract class ListMapable<T> implements Mapable {
  Mapable fromJsonList(List<dynamic> json);
}

abstract class ErrorMapable implements BaseMapable {
  String errorCode;
  String description;
}