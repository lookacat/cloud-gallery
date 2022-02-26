import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../../storage/storage.dart';
import 'package:path/path.dart';

class UploadWidget extends StatelessWidget {
  const UploadWidget({
    Key? key,
  }) : super(key: key);

  BoxDecoration getWidgetDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(27),
      color: const Color.fromRGBO(20, 20, 20, 1),
    );
  }

  Future<void> _uploadFiles() async {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

    if (selectedDirectory == null) return;

    final dir = Directory(selectedDirectory);
    final List<FileSystemEntity> entities = await dir.list().toList();
    final List<Future<dynamic>> uploads = <Future<dynamic>>[];
    var s = Storage().active;
    for (var item in entities) {
      await s!.uploadFile(item.path, "/files/admin/" + basename(item.path));
      print(item.path);
      print(basename(item.path));
    }
    await Future.wait<dynamic>(uploads);
    print("Upload completed");
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          padding: const EdgeInsets.all(27),
          decoration: getWidgetDecoration(),
          child: GestureDetector(
            child: const Center(
              child: Text("Upload",
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
            onTap: _uploadFiles,
          ),
        ));
  }
}
