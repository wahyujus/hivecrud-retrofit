import 'package:hive/hive.dart';
import 'package:hivecrud/model/transaction.dart';

class Boxes {
  static Box<Transaction> getTransactions() =>
      Hive.box<Transaction>('transaction');
}
