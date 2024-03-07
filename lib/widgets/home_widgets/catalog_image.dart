import 'package:flutter/material.dart';
import 'package:tryapp/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return Image.asset(image)
        .box
        .p8
        .color(MyTheme.creamcolor)
        .make()
        .p16()
        .w40(context);
  }
}
