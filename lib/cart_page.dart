import 'package:flutter/material.dart';
import 'package:tryapp/cart.dart';
import 'package:tryapp/core/store.dart';
import 'package:tryapp/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamcolor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: "Cart".text.color(Colors.black).center.make(),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        children: [
          VxConsumer(
              mutations: {RemoveMutation},
              notifications: {},
              builder: (context, dynamic, vx) {
                return " \$${_cart.totalPrice}"
                    .text
                    .xl5
                    .color(MyTheme.darkbluishColor)
                    .make();
              }),
          20.widthBox.expand(),
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: "Buying not supported yet".text.make(),
                    ));
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(MyTheme.darkbluishColor)),
                  child: "Buy".text.color(Colors.white).make())
              .w32(context)
              .p1()
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  _CartList({super.key});

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Nothing to show".text.make()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                  leading: Icon(Icons.done),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      RemoveMutation(_cart.items[index]);
                    },
                  ),
                  title: _cart.items[index].name.text.make(),
                ));
  }
}
