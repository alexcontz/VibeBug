import 'package:injectable/injectable.dart';

@injectableInit
void configureDependencies() => getIt.init();

@module
abstract class AppModule {
  @singleton
  AppConfig get appConfig => AppConfig();
}

class AppConfig {
  final String apiBaseUrl = 'https://api.prorotyp3.com';
  final String appName = 'Prorotyp3';
  final String appVersion = '1.0.0';
  
  // Database configuration
  final String dbName = 'prorotyp3.db';
  
  // Feature flags
  final bool enableCloudSync = true;
  final bool enableMultiCurrency = true;
  final bool enableTaxCalculations = true;
}
