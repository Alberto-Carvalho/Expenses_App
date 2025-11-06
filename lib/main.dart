import 'package:expenses_app/components/transactions_form.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'dart:math';
import 'package:expenses_app/components/transaction_list.dart';
import 'package:expenses_app/models/transaction.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Intl.defaultLocale = 'pt_BR';

  initializeDateFormatting('pt_BR', null);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomepage(),
      theme: ThemeData(primarySwatch: Colors.red, useMaterial3: false),
    );
  }
}

class MyHomepage extends StatefulWidget {
  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  final _transaction = [
    Transaction(
      id: 't1',
      title: 'tenis de corrida',
      value: 200.59,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Sapado de passeio',
      value: 199.90,
      date: DateTime.now(),
    ),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transaction.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _openTransactionFormModal() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionsForm(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _openTransactionFormModal,
            icon: Icon(Icons.add),
          ),
        ],

        title: Text('Despesas Pessoais'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Card(
              child: Text(
                'Grafico',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
          ),

          Expanded(child: TransactionList(_transaction)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        //backgroundColor: Colors.blue,
        shape: CircleBorder(),

        onPressed: _openTransactionFormModal,

        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
