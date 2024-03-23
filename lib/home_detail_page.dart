import 'package:flutter/material.dart';
import 'package:tryapp/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final catalog;

  const HomeDetailPage({key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        bottomNavigationBar: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}"
                .text
                .textStyle(TextStyle(fontSize: 25))
                .extraBold
                .gray800
                .make()
                .onTap(() {
              print(
                "The price of ${catalog.name} is \$${catalog.price}",
              );
            }),
            ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          MyTheme.darkbluishColor,
                        ),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: "Buying not supported yet".text.make(),
                      ));
                    },
                    child: "Buy".text.bold.color(Colors.white).make())
                .wh(100, 50)
          ],
        ).wh(100, 50).p32(),
        backgroundColor: MyTheme.creamcolor,
        body: SafeArea(
          child: Column(
            children: [
              Hero(
                      tag: Key(catalog.id.toString()),
                      child: Image.asset(catalog.image))
                  .h32(context),
              Expanded(
                  child: VxArc(
                height: 30.0,
                arcType: VxArcType.convey,
                edge: VxEdge.top,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      "${catalog.name}"
                          .text
                          .xl2
                          .minFontSize(16)
                          .bold
                          .make()
                          .centered()
                          .p2(),
                      "${catalog.desc}".text.make(),
                      "Experience cutting-edge technology with the iPhone 12. Boasting a stunning Super Retina XDR display, A14 Bionic chip, and 5G capability, this sleek device delivers unparalleled performance. Capture breathtaking moments with the advanced dual-camera system and enjoy the seamless integration of iOS 15. Elevate your mobile experience with the iPhone 12."
                          .text
                          .color(const Color.fromARGB(255, 45, 44, 44))
                          .maxFontSize(15)
                          .wordSpacing(1)
                          .make()
                          .p24()
                          .expand()
                    ],
                  ).py64(),
                ),
              )),
            ],
          ),
        ));
  }
}
