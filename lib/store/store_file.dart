import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

part 'store_file.g.dart';

class StoreFileA = StoreFileBase with _$StoreFileA;

abstract class StoreFileBase with Store {
  @observable
  ObservableMap<String, dynamic> files = ObservableMap.of({});

  @action
  void setFiles(ObservableMap<String, dynamic> data) => files = data;
}

class StoreFile {
  static final StoreFileA store = StoreFileA();
}
