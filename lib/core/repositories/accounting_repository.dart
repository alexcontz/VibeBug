import 'package:decimal/decimal.dart';
import 'package:injectable/injectable.dart';
import '../demo/demo_data.dart';

abstract class AccountingRepository {
  Future<List<AccountData>> getAccounts();
  Future<List<TransactionData>> getTransactions();
  Future<Map<String, Decimal>> getDashboardMetrics();
  Future<void> addTransaction(TransactionData transaction);
  Future<void> addAccount(AccountData account);
}

@Injectable(as: AccountingRepository)
@test
class DemoAccountingRepository implements AccountingRepository {
  @override
  Future<List<AccountData>> getAccounts() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    return DemoData.accounts;
  }

  @override
  Future<List<TransactionData>> getTransactions() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return DemoData.transactions;
  }

  @override
  Future<Map<String, Decimal>> getDashboardMetrics() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return DemoData.dashboardMetrics;
  }

  @override
  Future<void> addTransaction(TransactionData transaction) async {
    await Future.delayed(const Duration(milliseconds: 500));
    DemoData.transactions.add(transaction);
  }

  @override
  Future<void> addAccount(AccountData account) async {
    await Future.delayed(const Duration(milliseconds: 500));
    DemoData.accounts.add(account);
  }
}
