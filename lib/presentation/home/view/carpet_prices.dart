import 'package:alladin/domain/model/carpet.dart';
import 'package:flutter/material.dart';

class CarpetPrices extends StatefulWidget {
  final List<Carpet> carpets;

  const CarpetPrices({super.key, required this.carpets});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<CarpetPrices> createState() => _CarpetPricesState();
}

class _CarpetPricesState extends State<CarpetPrices> {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text("Nome")),
        DataColumn(label: Text("Valor(m2)"))
      ],
      rows: widget.carpets
          .map((e) => DataRow(cells: [
                DataCell(Text(e.name)),
                DataCell(Text(e.valorM2.toString()))
              ]))
          .toList(),
    );
  }
}
