import 'package:drift/drift.dart';

class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get reference => text()();
  DateTimeColumn get date => dateTime()();
  TextColumn get description => text()();
  TextColumn get type => text()(); // Journal, Invoice, Payment, etc.
  BoolColumn get posted => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  
  @override
  Set<Column> get primaryKey => {id};
}

class TransactionLines extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get transactionId => integer()();
  IntColumn get accountId => integer()();
  TextColumn get description => text().nullable()();
  RealColumn get debit => real().withDefault(const Constant(0))();
  RealColumn get credit => real().withDefault(const Constant(0))();
  TextColumn get currency => text().withDefault(const Constant('USD'))();
  RealColumn get exchangeRate => real().withDefault(const Constant(1))();
  
  @override
  Set<Column> get primaryKey => {id};
  
  @override
  List<Set<Column>> get uniqueKeys => [{transactionId, accountId}];
}
