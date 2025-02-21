// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutterappweb/core/injection/register_module.dart' as _i996;
import 'package:flutterappweb/data/api/api.dart' as _i718;
import 'package:flutterappweb/data/api/api.mock.dart' as _i901;
import 'package:flutterappweb/data/data.config.dart' as _i657;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

const String _mock = 'mock';
const String _production = 'production';
const String _staging = 'staging';
const String _develop = 'develop';

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetItDI(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.factory<_i657.IRestClient>(
    () => _i901.RestClientMock(),
    registerFor: {_mock},
  );
  gh.factory<_i657.IRestClient>(
    () => _i718.RestClient(
      gh<_i361.Dio>(),
      baseUrl: gh<String>(),
    ),
    registerFor: {
      _production,
      _staging,
      _develop,
    },
  );
  gh.singleton<_i361.Dio>(() => registerModule.baseDio());
  gh.singleton<_i718.RestClient>(() => registerModule.api());
  return getIt;
}

class _$RegisterModule extends _i996.RegisterModule {}
