
import 'package:tennis_app/config/env.dart';
import 'package:tennis_app/services/http/http_request.dart';

class CrawlingService extends HttpRequestProtocol {
  var crawlingRequest;
  String endPoint;

  CrawlingService(this.endPoint, this.crawlingRequest);

  @override
  String get baseUrl => environment['baseUrl'];

  @override
  ContentEncoding get contentEncoding => ContentEncoding.url;

  @override
  Map<String, String> get headers => {
    "content-type": "application/x-www-form-urlencoded",
    "accept": "application/json"
  };

  @override
  HttpMethod get method => HttpMethod.GET;

  @override
  Map<String, dynamic> get parameters => this.crawlingRequest.toJson();

  @override
  String get path => this.endPoint;
}

