import 'package:mobx/mobx.dart';
import 'package:webdav_client/webdav_client.dart';
import '../storage/storage.dart';
import 'package:path/path.dart' as path;

part 'store_file.g.dart';

class StoreFileA = StoreFileBase with _$StoreFileA;

abstract class StoreFileBase with Store {
  @observable
  ObservableMap<String, dynamic> files = ObservableMap.of({});

  @action
  void setFiles(ObservableMap<String, File> data) => files = data;

  @action
  Future loadAllDirectories() async {
    await loadDirectory();
  }

  @action
  Future loadDirectory({String directory = ""}) async {
    var storage = Storage().active!;
    var rootPath = "/files/admin";
    var directoryPath = path.join(rootPath, directory);

    Map<String, File> dir = await storage.getFiles(directoryPath);
    for (var key in dir.keys) {
      if (files.containsKey(key)) {
        files.remove(key);
      }
      files.addAll({
        key: dir[key]!,
      });
    }
  }
}

class StoreFile {
  static final StoreFileA store = StoreFileA();
}
