// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:prorotyp3/core/config/app_config.dart' as _i559;
import 'package:prorotyp3/core/database/database.dart' as _i785;
import 'package:prorotyp3/core/repositories/accounting_repository.dart'
    as _i695;
import 'package:prorotyp3/features/auth/bloc/auth_bloc.dart' as _i458;
import 'package:prorotyp3/features/dashboard/bloc/dashboard_bloc.dart' as _i714;

const String _test = 'test';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i458.AuthBloc>(() => _i458.AuthBloc());
    gh.singleton<_i559.AppConfig>(() => appModule.appConfig);
    gh.singleton<_i785.AppDatabase>(() => _i785.AppDatabase());
    gh.factory<_i695.AccountingRepository>(
      () => _i695.DemoAccountingRepository(),
      registerFor: {_test},
    );
    gh.factory<_i714.DashboardBloc>(
        () => _i714.DashboardBloc(gh<InvalidType>()));
    return this;
  }
}

class _$AppModule extends _i559.AppModule {}
