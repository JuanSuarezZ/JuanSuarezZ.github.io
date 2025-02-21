import 'dart:convert';

import 'package:dio/dio.dart';

class AppTransformer extends BackgroundTransformer {
  AppTransformer() : super();

  /// The [Options] doesn't contain the cookie info. we add the cookie
  /// info to [Options.extra], and you can retrieve it in [ResponseInterceptor]
  /// and [Response] with `response.request.extra["cookies"]`.
  @override
  Future transformResponse(
      RequestOptions options, ResponseBody response) async {
    dynamic json = await super.transformResponse(options, response);

    if (json is String) {
      if (json.isNotEmpty) {
        json = await jsonDecode(json);
      } else {
        return json;
      }
    }

    return json;
  }
}
