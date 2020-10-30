import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/header.dart';
import '../common/quantity_module.dart';
import '../models/food_catalog.dart';
import '../models/food_item.dart';
import 'food_categories.dart';

class FoodItems extends StatefulWidget {
  FoodItems({Key key}) : super(key: key);

  static const routeName = '/food_items';
  @override
  _FoodItemsState createState() => _FoodItemsState();
}

class _FoodItemsState extends State<FoodItems> {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Consumer<FoodCatalog>(
          builder: (BuildContext context, FoodCatalog value, Widget child) {
        return Container(
          color: Colors.orangeAccent,
          child: Column(children: [
            Header(value),
            Container(
              height: 40.0,
              width: MediaQuery.of(context).size.width,
              child: Text(value.foodCategories[args.categoryIndex],
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
            ),
            Container(
              color: Colors.white,
              height: 450.0,
              width: MediaQuery.of(context).size.width - 20,
              child: ListView.separated(
                itemCount: value.allItems[args.categoryIndex].length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 60.0,
                    child: ListTile(
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.fastfood, color: Colors.blueGrey),
                            Text(
                                value.getItem(args.categoryIndex, index).prix +
                                    "€",
                                style: TextStyle(fontSize: 20.0))
                          ],
                        ),
                        title: Row(
                          children: [
                            isFavorited(
                                value.getItem(args.categoryIndex, index)),
                            Text(value.getItem(args.categoryIndex, index).name),
                          ],
                        ),
                        subtitle: Text(value
                            .getItem(args.categoryIndex, index)
                            .ingredientsNamesShort),
                        trailing: QuantityModule(
                            value.getItem(args.categoryIndex, index),
                            index,
                            value),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(
                                    builder: (context, setState) {
                                  return SimpleDialog(
                                    title: Text("Info Supplémentaire :"),
                                    children: [
                                      Container(
                                        height: 100.0,
                                        child: Center(
                                          child: Text(
                                            value
                                                .getItem(
                                                    args.categoryIndex, index)
                                                .ingredientsNames,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      Container(
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                            Text("Ajouter à vos favoris :"),
                                            IconButton(
                                                iconSize: 40.0,
                                                icon: iconChoice(value.getItem(
                                                    args.categoryIndex, index)),
                                                onPressed: () {
                                                  setState(() {
                                                    value.toggleFavorite(
                                                        value.getItem(
                                                            args.categoryIndex,
                                                            index));
                                                  });
                                                })
                                          ]))
                                    ],
                                  );
                                });
                              }); //////ici
                        }),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(color: Colors.orangeAccent, thickness: 5.0);
                },
              ),
            ),
            Container(
                alignment: Alignment.bottomRight,
                height: 60.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/food_basket");
                  },
                  child: Text("Valider la commande"),
                ))
          ]),
        );
      }),
    );
  }
}

Widget iconChoice(FoodItem item) {
  return item.isFavorited
      ? Icon(Icons.favorite, color: Colors.pink)
      : Icon(Icons.favorite_border);
}

Widget isFavorited(FoodItem item) {
  return item.isFavorited
      ? Icon(Icons.favorite, color: Colors.pink, size: 18.0)
      : Container(height: 0, width: 0);
}
