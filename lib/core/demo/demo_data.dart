import 'package:decimal/decimal.dart';

class DemoData {
  static final List<AccountData> accounts = [
    AccountData(
      id: 1,
      code: '1000',
      name: 'Cash',
      type: 'Asset',
      balance: Decimal.parse('25000.00'),
    ),
    AccountData(
      id: 2,
      code: '1001',
      name: 'Bank Account',
      type: 'Asset',
      balance: Decimal.parse('75000.00'),
    ),
    AccountData(
      id: 3,
      code: '2000',
      name: 'Accounts Payable',
      type: 'Liability',
      balance: Decimal.parse('15000.00'),
    ),
    AccountData(
      id: 4,
      code: '4000',
      name: 'Sales Revenue',
      type: 'Revenue',
      balance: Decimal.parse('150000.00'),
    ),
    AccountData(
      id: 5,
      code: '5000',
      name: 'Operating Expenses',
      type: 'Expense',
      balance: Decimal.parse('75000.00'),
    ),
  ];

  static final List<TransactionData> transactions = [
    TransactionData(
      id: 1,
      date: DateTime.now().subtract(const Duration(days: 5)),
      reference: 'INV-001',
      description: 'Sales Invoice #001',
      amount: Decimal.parse('5000.00'),
      type: 'Invoice',
      entries: [
        TransactionEntry(accountId: 1, debit: Decimal.parse('5000.00'), credit: Decimal.zero),
        TransactionEntry(accountId: 4, debit: Decimal.zero, credit: Decimal.parse('5000.00')),
      ],
    ),
    TransactionData(
      id: 2,
      date: DateTime.now().subtract(const Duration(days: 3)),
      reference: 'EXP-001',
      description: 'Office Supplies',
      amount: Decimal.parse('500.00'),
      type: 'Expense',
      entries: [
        TransactionEntry(accountId: 5, debit: Decimal.parse('500.00'), credit: Decimal.zero),
        TransactionEntry(accountId: 1, debit: Decimal.zero, credit: Decimal.parse('500.00')),
      ],
    ),
  ];

  static final Map<String, Decimal> dashboardMetrics = {
    'cashBalance': Decimal.parse('100000.00'),
    'totalRevenue': Decimal.parse('150000.00'),
    'totalExpenses': Decimal.parse('75000.00'),
    'profit': Decimal.parse('75000.00'),
    'accountsReceivable': Decimal.parse('25000.00'),
    'accountsPayable': Decimal.parse('15000.00'),
  };
}

class AccountData {
  final int id;
  final String code;
  final String name;
  final String type;
  final Decimal balance;

  AccountData({
    required this.id,
    required this.code,
    required this.name,
    required this.type,
    required this.balance,
  });
}

class TransactionData {
  final int id;
  final DateTime date;
  final String reference;
  final String description;
  final Decimal amount;
  final String type;
  final List<TransactionEntry> entries;

  TransactionData({
    required this.id,
    required this.date,
    required this.reference,
    required this.description,
    required this.amount,
    required this.type,
    required this.entries,
  });
}

class TransactionEntry {
  final int accountId;
  final Decimal debit;
  final Decimal credit;

  TransactionEntry({
    required this.accountId,
    required this.debit,
    required this.credit,
  });
}
