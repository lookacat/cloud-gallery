import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

part 'store_gallery.g.dart';

class StoreGalleryA = StoreGalleryBase with _$StoreGalleryA;

abstract class StoreGalleryBase with Store {
  @observable
  var images = ObservableList<Image>();

// This is action method. You need to use this method to react
// your UI properly when somethig changes in your observable list.
  @action
  void addItem(Image data) => images.add(data);

// the same for this method but with a different operation.
  @action
  void removeItem(Image data) => images.remove(data);
}

class StoreGallery {
  static final StoreGalleryA store = StoreGalleryA();
}
