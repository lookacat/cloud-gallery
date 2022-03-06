import 'package:flutter/material.dart';

class FilePage extends StatefulWidget {
  const FilePage({Key? key}) : super(key: key);

  @override
  State<FilePage> createState() => _FilePageState();
}

class _FilePageState extends State<FilePage> {
  @override
  void initState() {
    super.initState();
  }

  TableRow buildTableHead() {
    return TableRow(children: [
      TableCell(
        child: Column(),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
          child: Column(
            children: const [
              Text(
                'Name',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    ]);
  }

  List<TableRow> buildFilesTable() {
    List<TableRow> files = <TableRow>[];

    return [
      buildTableHead(),
      TableRow(children: [
        Container(),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
            child: Column(
              children: const [
                Text(
                  'Name',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(color: Color(0xff1F2123)),
        child: Container(
          margin: const EdgeInsets.only(top: 50),
          child: Table(
              columnWidths: const {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(9)
              },
              border: const TableBorder(
                  horizontalInside: BorderSide(width: 1, color: Colors.white)),
              /*TableBorder.all(
                width: 1.0,
                color: Colors.white,
              ),*/
              children: buildFilesTable()),
        ),
      ),
    );
  }
}
