
import 'package:http/http.dart';
import 'package:tennis_app/models/crawling_model.dart';
import 'package:tennis_app/services/http/api/crawling/crawling_api.dart';
import 'package:tennis_app/services/http/api/crawling/crwaling_service.dart';
import 'package:tennis_app/services/http/http_error.dart';
import 'package:tennis_app/services/http/http_session.dart';


Future makeCrawlingRequest(String id) async {
  final String courtNumber = id;
  Map _crawlingJsonString;
  String _crawlingFinalString = '{}';

  final crawlingClient = Client();
  final crawlingRequest = CrawlingRequest();

  final crawlingService = CrawlingService('lists/$courtNumber',crawlingRequest);
  final crawlingSession = HttpSession(crawlingClient);
  final crawlingBase = CrawlingBase();
  final crawlingServerResponse = await crawlingSession.request(service: crawlingService, responseType: crawlingBase);
  if(crawlingServerResponse is ErrorResponse) {
    _crawlingFinalString = '{"errorCode:" "${crawlingServerResponse.errorCode}", "Description": "${crawlingServerResponse.description}"}';
  } else if (crawlingServerResponse is CrawlingBase) {
    
    _crawlingJsonString = Crawling().toJson(crawlingServerResponse.data.data);
  }

  return _crawlingJsonString;
}