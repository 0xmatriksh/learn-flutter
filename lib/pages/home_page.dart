import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:learn_flutter/widgets/drawer.dart';
import 'package:learn_flutter/model/catalog.dart';
import 'package:learn_flutter/widgets/items.dart';

class HomePage extends StatefulWidget {
  // final items = Catalog.products;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var json = await rootBundle.loadString('assets/files/catalog.json');
    var decodedData = jsonDecode(json);
    var productData = decodedData['products'];
    // print(productData);
    Catalog.products = productData
        .map((item) => Item(
                //List.from(productData), can use <Item>
                color: item['color'],
                id: item['id'],
                imageUrl: item['image'],
                name: item['name'],
                desc: item['desc'],
                price: item[
                    'price']) //you can use named constructor as factory for this too, will do that in future[MAYBE]
            )
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(50, (index) => Catalog.products[0]);
    return Material(
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(32),
          color: Colors.orange[50],
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Catalog App',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Text(
              'Trending products',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            if (Catalog.products != null && Catalog.products.isNotEmpty)
              Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: Catalog.products.length,
                      itemBuilder: (context, index) {
                        final item = Catalog.products[index];
                        return ItemWidget(item: item);
                      }))
            // Text('hello')
            else
              Center(
                child: CircularProgressIndicator(),
              ),
          ]),
        ),
      ),
    );
  }
}
