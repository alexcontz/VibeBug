part of 'dashboard_bloc.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.loading() = _Loading;
  const factory DashboardState.loaded({
    required Map<String, Decimal> metrics,
    required List<TransactionData> recentTransactions,
  }) = _Loaded;
  const factory DashboardState.error(String message) = _Error;
}
