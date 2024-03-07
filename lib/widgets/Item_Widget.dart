// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:tryapp/Catelog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        onLongPress: () {
          print("${item.name}");
        },
        leading: Image.asset(
          item.image,
          width: 50,
        ),
        // title: Text(item.name),
        // subtitle: Text(item.desc),
        // trailing: Text(
        //   "\$${item.price}",
        //   textScaleFactor: 1.1,
        //   style: const TextStyle(
        //       fontWeight: FontWeight.bold,
        //       color: Color.fromARGB(255, 113, 17, 247)),
        // ),
        onTap: () {
          print("${item.name} pressed");
        },
      ),
    );
  }
}
