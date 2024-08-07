import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:data_table_2/data_table_2.dart';

class DataTableScreen extends StatelessWidget {
  const DataTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Table Test"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 300,
                child: PlutoGrid(
                    //필터, 컬럼 재배치, 수정, 오름/내림차순 등 다양한 기능이 있으나 컬럼 픽스는 안됨
                    //수정에 용이해 보이나 흠... 단순 리드온리는... 설정마이 건들여야됨 ㄷㄷ
                    //row 데이터를 map으로 컬럼 값과 매칭해야됨...

                    columns: columns,
                    rows: rows,
                    onChanged: (PlutoGridOnChangedEvent event) {
                      print(event);
                    },
                    onLoaded: (PlutoGridOnLoadedEvent event) {
                      print(event);
                    }),
              ),
              SizedBox(
                height: 300,
                child: DataTable2(
                    border: TableBorder.all(color: Colors.green, width: 0.5),
                    columnSpacing: 12,
                    horizontalMargin: 12,
                    minWidth: 600,
                    fixedLeftColumns: 1,
                    columns: [
                      DataColumn2(
                        label: Text('Column A'),
                        size: ColumnSize.L,
                      ),
                      DataColumn(label: Text('Column B')),
                      DataColumn(label: Text('Column C')),
                      DataColumn(label: Text('Column D')),
                      DataColumn2(
                        label: Text('Column NUMBERS'),
                        size: ColumnSize.L,
                      ),
                    ],
                    rows: List<DataRow>.generate(
                        100,
                        (index) => DataRow(cells: [
                              DataCell(Text('A' * (10 - index % 10))),
                              DataCell(Text('B' * (10 - (index + 5) % 10))),
                              DataCell(Text('C' * (15 - (index + 5) % 10))),
                              DataCell(Text('D' * (15 - (index + 10) % 10))),
                              DataCell(Text(((index + 0.1) * 25.4).toString()))
                            ]))),
              )
            ],
          )),
    );
  }
}

List<PlutoColumn> columns = [
  /// Text Column definition
  PlutoColumn(
    title: 'text column',
    field: 'text_field',
    type: PlutoColumnType.text(),
    readOnly: true,
    enableRowDrag: false,
    enableColumnDrag: false,
    enableAutoEditing: false,
    enableContextMenu: false,
    enableDropToResize: false,
    enableEditingMode: false,
    enableHideColumnMenuItem: false,
  ),

  /// Number Column definition
  PlutoColumn(
    title: 'number column',
    field: 'number_field',
    type: PlutoColumnType.number(),
    readOnly: true,
    enableRowDrag: false,
    enableColumnDrag: false,
    enableAutoEditing: false,
    enableContextMenu: false,
    enableDropToResize: false,
    enableEditingMode: false,
    enableHideColumnMenuItem: false,
  ),

  /// Select Column definition
  PlutoColumn(
    title: 'select column',
    field: 'select_field',
    type: PlutoColumnType.select(['item1', 'item2', 'item3']),
    readOnly: true,
    enableRowDrag: false,
    enableColumnDrag: false,
    enableAutoEditing: false,
    enableContextMenu: false,
    enableDropToResize: false,
    enableEditingMode: false,
    enableHideColumnMenuItem: false,
  ),

  /// Datetime Column definition
  PlutoColumn(
    title: 'date column',
    field: 'date_field',
    type: PlutoColumnType.date(),
    readOnly: true,
    enableRowDrag: false,
    enableColumnDrag: false,
    enableAutoEditing: false,
    enableContextMenu: false,
    enableDropToResize: false,
    enableEditingMode: false,
    enableHideColumnMenuItem: false,
  ),

  /// Time Column definition
  PlutoColumn(
    title: 'time column',
    field: 'time_field',
    type: PlutoColumnType.time(),
    readOnly: true,
    enableRowDrag: false,
    enableColumnDrag: false,
    enableAutoEditing: false,
    enableContextMenu: false,
    enableDropToResize: false,
    enableEditingMode: false,
    enableHideColumnMenuItem: false,
  ),
];

List<PlutoRow> rows = [
  PlutoRow(
    cells: {
      'text_field': PlutoCell(value: 'Text cell value1'),
      'number_field': PlutoCell(value: 2020),
      'select_field': PlutoCell(value: 'item1'),
      'date_field': PlutoCell(value: '2020-08-06'),
      'time_field': PlutoCell(value: '12:30'),
    },
  ),
  PlutoRow(
    cells: {
      'text_field': PlutoCell(value: 'Text cell value2'),
      'number_field': PlutoCell(value: 2021),
      'select_field': PlutoCell(value: 'item2'),
      'date_field': PlutoCell(value: '2020-08-07'),
      'time_field': PlutoCell(value: '18:45'),
    },
  ),
  PlutoRow(
    cells: {
      'text_field': PlutoCell(value: 'Text cell value1'),
      'number_field': PlutoCell(value: 2020),
      'select_field': PlutoCell(value: 'item1'),
      'date_field': PlutoCell(value: '2020-08-06'),
      'time_field': PlutoCell(value: '12:30'),
    },
  ),
  PlutoRow(
    cells: {
      'text_field': PlutoCell(value: 'Text cell value2'),
      'number_field': PlutoCell(value: 2021),
      'select_field': PlutoCell(value: 'item2'),
      'date_field': PlutoCell(value: '2020-08-07'),
      'time_field': PlutoCell(value: '18:45'),
    },
  ),
  PlutoRow(
    cells: {
      'text_field': PlutoCell(value: 'Text cell value1'),
      'number_field': PlutoCell(value: 2020),
      'select_field': PlutoCell(value: 'item1'),
      'date_field': PlutoCell(value: '2020-08-06'),
      'time_field': PlutoCell(value: '12:30'),
    },
  ),
  PlutoRow(
    cells: {
      'text_field': PlutoCell(value: 'Text cell value2'),
      'number_field': PlutoCell(value: 2021),
      'select_field': PlutoCell(value: 'item2'),
      'date_field': PlutoCell(value: '2020-08-07'),
      'time_field': PlutoCell(value: '18:45'),
    },
  ),
  PlutoRow(
    cells: {
      'text_field': PlutoCell(value: 'Text cell value1'),
      'number_field': PlutoCell(value: 2020),
      'select_field': PlutoCell(value: 'item1'),
      'date_field': PlutoCell(value: '2020-08-06'),
      'time_field': PlutoCell(value: '12:30'),
    },
  ),
  PlutoRow(
    cells: {
      'text_field': PlutoCell(value: 'Text cell value2'),
      'number_field': PlutoCell(value: 2021),
      'select_field': PlutoCell(value: 'item2'),
      'date_field': PlutoCell(value: '2020-08-07'),
      'time_field': PlutoCell(value: '18:45'),
    },
  ),
];
