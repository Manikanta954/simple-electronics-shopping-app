class CatalogModel {
  static List<Item> Items = [
    Item(
        id: 1,
        name: "iPhone 12 pro",
        desc: "Apple iPhone 12th generation",
        price: 99999,
        color: "#33505a",
        image: "assets/images/iphone12.png"),
  ];
  Item getById(int id) =>
      Items.firstWhere((element) => element.id == id, orElse: null);
  Item getByPosition(int pos) => Items[pos];
}

class Item {
  final num id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

  // ignore: dead_code
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
    // toMap() => {
    //       "id": id,
    //       "name": name,
    //       "desc": desc,
    //       "price": price,
    //       "color": color,
    //       "image": image,
    //     };
  }
}
