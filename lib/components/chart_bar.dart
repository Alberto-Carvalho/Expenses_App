import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label; // letras dias da semana
  final double valorGasto; // O valor gasto no dia
  final double
  totalPorcentagem; // A porcentagem que esse dia representa do total gasto na semana(entre 0.0 e 1.0)

  ChartBar(this.label, this.valorGasto, this.totalPorcentagem);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 20,
          child: FittedBox(child: Text('R\$${valorGasto.toStringAsFixed(2)}')),
        ),

        Container(
          height: 100,
          width: 10,
          
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              FractionallySizedBox(
                heightFactor: totalPorcentagem,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),

        Text(label),
      ],
    );
  }
}
