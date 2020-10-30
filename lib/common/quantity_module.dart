import 'package:flutter/material.dart';

import '../models/food_catalog.dart';
import '../models/food_item.dart';

class QuantityModule extends StatefulWidget {
  int _categoryIndex;
  int _index;
  FoodItem _item;
  FoodCatalog _value;
  QuantityModule(this._item, this._index, this._value, {Key key})
      : super(key: key);

  @override
  _QuantityModuleState createState() => _QuantityModuleState();
}

class _QuantityModuleState extends State<QuantityModule> {
  @override
  Widget build(BuildContext context) {
    FoodItem item = widget._item;
    // FoodItem item = widget._value.getItem(widget._categoryIndex, widget._index);
    return Container(
      width: 116.0,
      height: 50.0,
      child: Row(
        children: [
          IconButton(
            color: Colors.blueAccent,
            padding: EdgeInsets.all(0),
            iconSize: 40.0,
            icon: Icon(Icons.remove, size: 40.0),
            onPressed: () {
              if (item.amountSelected > 0) {
                widget._value.removeFromFoodBasket(item);
              }
            },
          ),
          // SizedBox(width: 10.0),
          Container(
            width: 20,
            child: Center(
              child: Text(item.amountSelected.toString(),
                  style:
                      TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
            ),
          ),
          // SizedBox(width: 10.0),
          IconButton(
            color: Colors.blueAccent,
            padding: EdgeInsets.all(0),
            iconSize: 40.0,
            icon: Icon(Icons.add, size: 40.0),
            onPressed: () {
              widget._value.addToFoodBasket(item);
            },
          )
        ],
      ),
    );
  }
}
