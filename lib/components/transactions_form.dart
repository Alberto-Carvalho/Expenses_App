import 'package:flutter/material.dart';

class TransactionsForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionsForm(this.onSubmit);

  @override
  State<TransactionsForm> createState() => _TransactionsFormState();
}

class _TransactionsFormState extends State<TransactionsForm> {
  final valueController = TextEditingController();

  final titleCrontroller = TextEditingController();

  _submitForm() {
    final Title = titleCrontroller.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (Title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(Title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              onSubmitted: (_) => -_submitForm(),
              controller: titleCrontroller,
              decoration: InputDecoration(
                labelText: 'Titulo',
                labelStyle: TextStyle(
                  fontFamily: 'Quicksand-bold',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
              controller: valueController,
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
                labelStyle: TextStyle(
                  fontFamily: 'Quicksand-bold',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: _submitForm,
                child: Text(
                  'Nova transação',
                  style: TextStyle(fontFamily: 'OpenSans-bold', fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
