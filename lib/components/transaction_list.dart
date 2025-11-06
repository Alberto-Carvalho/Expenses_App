import 'package:expenses_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> transactions;

  TransactionList(this.transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (ctx, index) {
        final tr = transactions[index];
        return Card(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),

                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple[50]!, width: 2),
                ),

                padding: EdgeInsets.all(10),

                child: Text(
                  'R\$ ${tr.value.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tr.title, style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    DateFormat('d MMM y').format(tr.date),
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
