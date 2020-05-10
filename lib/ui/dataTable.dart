

import 'package:emi_calculator/models/emiModel.dart';
import 'package:flutter/material.dart';

class DataTableWidget extends StatelessWidget{

  final List<Map<String, String>> listOfColumns;

  DataTableWidget({@required this.listOfColumns});

  @override
  Widget build(BuildContext context) {
    return DataTable(

      columns: [
        
        DataColumn(label: Text('Month')),
        DataColumn(label: Text('Principal')),
        DataColumn(label: Text('Interest Paid')),
        DataColumn(label: Text('Principal Paid')),
        DataColumn(label: Text('Balance')),
      ],
      rows: 
        listOfColumns.map(
          ((element) => DataRow(

            cells: <DataCell>[
              DataCell(Text(element['Month'])),
              DataCell(Text(element['Principal'])),
              DataCell(Text(element['InterestP'])),
              DataCell(Text(element['PrinciplaP'])),
              DataCell(Text(element['RemainP'])),
            ]
          )
          )
        )
        .toList(),
    );
  }
}