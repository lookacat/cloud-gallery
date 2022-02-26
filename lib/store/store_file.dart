import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

part 'store_file.g.dart';

class StoreFileA = StoreFileBase with _$StoreFileA;

abstract class StoreFileBase with Store {
  @observable
  ObservableList<Image> images = ObservableList<Image>();

  @action
  void addItem(Image data) => images.add(data);
}

class StoreFile {
  static final StoreFileA store = StoreFileA();
}
