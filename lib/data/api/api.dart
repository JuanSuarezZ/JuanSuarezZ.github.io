

import 'package:dio/dio.dart';
import 'package:flutterappweb/core/core.config.dart';
import 'package:flutterappweb/data/data.config.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi()
@Injectable(
  as: IRestClient,
  order: InjectionPriority.datasource,
  env: [
    AppEnvironment.production,
    AppEnvironment.staging,
    AppEnvironment.develop
  ],
)
//
abstract class RestClient implements IRestClient {

  @factoryMethod
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

}
