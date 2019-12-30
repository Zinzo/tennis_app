

import 'package:tennis_app/models/crawling_model.dart';
import 'package:tennis_app/services/http/network_mappers.dart';

class CrawlingRequest extends RequestMapable {
  CrawlingRequest();

  @override
  Map<String, dynamic> toJson() => {
  };
}

class CrawlingResponse {
  final Crawling data;

  CrawlingResponse({this.data});

  factory CrawlingResponse.fromJson(Map<String,dynamic> json) {
    return new CrawlingResponse(
      data: Crawling.fromJson(json)
    );
  }
}

class CrawlingBase extends BaseMapable {
  CrawlingResponse data;

  Mapable fromJson(Map<String,dynamic> json) {
    data = CrawlingResponse.fromJson(json);
    return this;
  }
}