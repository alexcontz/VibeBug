import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../core/repositories/accounting_repository.dart';

part 'dashboard_bloc.freezed.dart';
part 'dashboard_event.dart';
part 'dashboard_state.dart';

@injectable
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final AccountingRepository _repository;

  DashboardBloc(this._repository) : super(const DashboardState.loading()) {
    on<_LoadDashboard>(_onLoadDashboard);
  }

  Future<void> _onLoadDashboard(_LoadDashboard event, Emitter<DashboardState> emit) async {
    try {
      emit(const DashboardState.loading());
      final metrics = await _repository.getDashboardMetrics();
      final transactions = await _repository.getTransactions();
      emit(DashboardState.loaded(metrics: metrics, recentTransactions: transactions));
    } catch (e) {
      emit(DashboardState.error(e.toString()));
    }
  }
}
