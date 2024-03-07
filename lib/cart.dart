import 'package:tryapp/Catelog.dart';
import 'package:tryapp/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  late CatalogModel _catalog;

  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    // ignore: unnecessary_null_comparison
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  List<Item> get items => _itemIds.map((id) => catalog.getById(id)).toList();
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void remove(Item item) {
    _itemIds.remove(item.id);
  }

  void add1(Item item) {
    _itemIds.add(item.id as int);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id as int);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.remove(item.id as int);
  }
}
