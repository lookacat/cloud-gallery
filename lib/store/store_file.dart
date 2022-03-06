import 'package:mobx/mobx.dart';

import '../models/resource.dart';
import '../storage/storage.dart';

part 'store_file.g.dart';

class StoreFileA = StoreFileBase with _$StoreFileA;

abstract class StoreFileBase with Store {
  @observable
  ObservableMap<String, Resource> files = ObservableMap.of({});

  @action
  void setFiles(ObservableMap<String, Resource> data) => files = data;

  @action
  Future loadDirectory() async {
    var storage = Storage().active!;
    Map<String, Resource> dir = await storage.getFiles("/files/admin");
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
