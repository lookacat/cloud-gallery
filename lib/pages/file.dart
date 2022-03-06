import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../store/store_file.dart';

class FilePage extends StatefulWidget {
  const FilePage({Key? key}) : super(key: key);

  @override
  State<FilePage> createState() => _FilePageState();
}

class _FilePageState extends State<FilePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(initFilePage);
  }

  Future initFilePage() async {
    await StoreFile.store.loadDirectory();
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
    var storeFiles = StoreFile.store.files;
    files.add(buildTableHead());
    for (var key in storeFiles.keys) {
      files.add(
        TableRow(children: [
          Container(),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
              child: Column(
                children: [
                  Text(
                    storeFiles[key]!.name.toString(),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      );
    }
    return files;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(color: Color(0xff1F2123)),
        child: Container(
          margin: const EdgeInsets.only(top: 50),
          child: Observer(
            builder: (context) => Table(
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(9)
                },
                border: const TableBorder(
                    horizontalInside:
                        BorderSide(width: 1, color: Colors.white)),
                /*TableBorder.all(
                width: 1.0,
                color: Colors.white,
              ),*/
                children: buildFilesTable()),
          ),
        ),
      ),
    );
  }
}
