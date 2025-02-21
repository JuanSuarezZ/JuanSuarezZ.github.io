
import 'package:flutterappweb/core/core.config.dart';
import 'package:flutterappweb/data/data.config.dart';
import 'package:injectable/injectable.dart';

@Injectable(
  as: IRestClient,
  order: InjectionPriority.datasource,
  env: [AppEnvironment.mock],
)
//
class RestClientMock implements IRestClient {
  
}
