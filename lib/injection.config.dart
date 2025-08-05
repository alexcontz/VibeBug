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

import 'core/config/app_config.dart' as _i828;
import 'core/database/database.dart' as _i234;
import 'core/repositories/accounting_repository.dart' as _i635;
import 'features/auth/bloc/auth_bloc.dart' as _i277;
import 'features/dashboard/bloc/dashboard_bloc.dart' as _i172;

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
    gh.factory<_i277.AuthBloc>(() => _i277.AuthBloc());
    gh.singleton<_i828.AppConfig>(() => appModule.appConfig);
    gh.singleton<_i234.AppDatabase>(() => _i234.AppDatabase());
    gh.factory<_i635.AccountingRepository>(
      () => _i635.DemoAccountingRepository(),
      registerFor: {_test},
    );
    gh.factory<_i172.DashboardBloc>(
        () => _i172.DashboardBloc(gh<InvalidType>()));
    return this;
  }
}

class _$AppModule extends _i828.AppModule {}
