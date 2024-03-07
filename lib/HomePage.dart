// ignore_for_file: unnecessary_null_comparison
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tryapp/Catelog.dart';
import 'package:tryapp/cart.dart';
import 'package:tryapp/core/store.dart';
import 'package:tryapp/utils/routes.dart';
import 'package:tryapp/widgets/drawer.dart';
import 'package:tryapp/widgets/home_widgets/catalog_header.dart';
import 'package:tryapp/widgets/home_widgets/catalog_list.dart';
import 'package:tryapp/widgets/themes.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dummyList = List.generate(20, (index) => CatalogModel.Items[0]);
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    var catalogjson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogjson);
    var productData = decodedData["products"];
    CatalogModel.Items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore);
    return Scaffold(
      drawer: MyDrawer(),
      floatingActionButton: VxBuilder(
          mutations: {AddMutation, RemoveMutation},
          builder: (context, dynamic, VxStatus) => FloatingActionButton(
                onPressed: () =>
                    Navigator.pushNamed(context, MyRoutes.cartRoute),
                backgroundColor: MyTheme.darkbluishColor,
                child: Icon(CupertinoIcons.cart),
              ).badge(
                  color: Vx.gray300,
                  size: 22,
                  count: _cart.cart.items.length,
                  textStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold))),
      backgroundColor: MyTheme.creamcolor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.Items != null && CatalogModel.Items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
