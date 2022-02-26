import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

part 'store_gallery.g.dart';

class StoreGalleryA = StoreGalleryBase with _$StoreGalleryA;

abstract class StoreGalleryBase with Store {
  @observable
  ObservableList<Image> images = ObservableList<Image>();

  @observable
  int crossAxisCount = 1;

  @action
  void addItem(Image data) => images.add(data);

  @action
  void removeItem(Image data) => images.remove(data);

  @action
  void setCrossAxisCount(int count) => crossAxisCount = count;
}

class StoreGallery {
  static final StoreGalleryA store = StoreGalleryA();
}
