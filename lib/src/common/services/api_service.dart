import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class APIService {
  factory APIService() => _;

  const APIService._instance();

  static const _ = APIService._instance();

  Future<String> request(
    String requestPath, {
    Map<String, String> headers = const {},
  }) async {
    final uri = Uri.parse(requestPath);
    try {
      Response response =
          await get(uri, headers: headers).timeout(const Duration(seconds: 10));

      return switch (response.statusCode) {
        < 200 => throw Error.throwWithStackTrace(
            "${response.reasonPhrase}",
            StackTrace.current,
          ),
        >= 200 && < 300 => response.body,
        >= 300 && < 400 => throw Error.throwWithStackTrace(
            "${response.reasonPhrase}",
            StackTrace.current,
          ),
        >= 400 && < 500 => throw Error.throwWithStackTrace(
            "Client Error",
            StackTrace.current,
          ),
        >= 500 => throw Error.throwWithStackTrace(
            "Server Error",
            StackTrace.current,
          ),
        _ => throw Error.throwWithStackTrace(
            "Unexpected Error",
            StackTrace.current,
          ),
      };
    } on TimeoutException catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");
      throw Error.throwWithStackTrace(
        "Check your network connection!",
        StackTrace.current,
      );
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");
      rethrow;
    }
  }
}
