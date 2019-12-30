import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:tennis_app/services/http/http_error.dart';

import 'http_request.dart';
import 'network_mappers.dart';

abstract class HttpSessionProtocol<T> {
  Future<Mapable> request({HttpRequestProtocol service, Mapable responseType});
}

class HttpSession implements HttpSessionProtocol {
  
  final Client _client;

  HttpSession(this._client);

  @override
  Future<Mapable> request(
      {HttpRequestProtocol service, Mapable responseType}) async {
    final request = HttpRequest(service);
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        final requestResponse = await _client.send(request);
        if (requestResponse.statusCode >= 200 &&
            requestResponse.statusCode <= 299) {
          final data = await requestResponse.stream.transform(utf8.decoder).join();
          return Mapable(responseType, data);
        } else {
          final Map<String, dynamic> responseError = {
            "error_code": "${requestResponse.statusCode}",
            "description": "Invalid"
          };

          return ErrorResponse().fromJson(responseError);
        }
      }
    } on SocketException catch (_) {
      // navigatorKey.currentState.pushNamed('/unconnected');
    }
  }
}