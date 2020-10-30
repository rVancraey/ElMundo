import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/header.dart';
import '../models/food_catalog.dart';
import 'food_items.dart';

class FoodCategories extends StatefulWidget {
  FoodCategories({Key key}) : super(key: key);

  @override
  _FoodCategoriesState createState() => _FoodCategoriesState();
}

class _FoodCategoriesState extends State<FoodCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<FoodCatalog>(
          builder: (BuildContext context, FoodCatalog value, Widget child) {
        return Container(
          color: Colors.orangeAccent,
          child: Column(children: [
            Header(value),
            Container(
              color: Colors.white,
              height: 500.0,
              width: MediaQuery.of(context).size.width - 20,
              child: ListView.separated(
                // padding: EdgeInsets.all(0.0),
                itemCount: value.foodCategories.length,
                itemBuilder: (context, index) {
                  return FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, FoodItems.routeName,
                          arguments: ScreenArguments(index));
                    },
                    child: Container(
                        height: 100.0,
                        child: ListTile(
                            title: Center(
                                child: Text(value.foodCategories[index])))),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(color: Colors.orangeAccent, thickness: 8.0);
                },
              ),
            ),
          ]),
        );
      }),
    );
  }
}

class ScreenArguments {
  final int categoryIndex;
  ScreenArguments(this.categoryIndex);
}
