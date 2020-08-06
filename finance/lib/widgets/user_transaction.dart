import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _transactionList = [
    Transaction(
      id: '1',
      title: 'Laptop',
      amount: 2700.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Car',
      amount: 34543.44,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      id: _transactionList.length.toString(),
      date: DateTime.now(),
    );

    setState(() {
      _transactionList.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_transactionList),
      ],
    );
  }
}
