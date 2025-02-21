import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:flutterappweb/core/injection/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetItDI',
  preferRelativeImports: false,
  asExtension: false,
)
Future<void> configureDependencies(String environment) async =>
    $initGetItDI(getIt, environment: environment);
