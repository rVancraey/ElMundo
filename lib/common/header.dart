import 'package:flutter/material.dart';
import '../models/food_catalog.dart';
import 'logo.dart';

class Header extends StatefulWidget {
  FoodCatalog _value;
  Header(this._value, {Key key}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 130.0,
        child: Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Flexible(
                child: Container(
                    child: IconButton(
                  color: Colors.white,
                  iconSize: 45,
                  icon: Icon(Icons.arrow_back, size: 45),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )),
                flex: 1),
            Flexible(child: Container(child: Logo()), flex: 4),
            Flexible(
                child: Stack(children: [
                  Container(
                      child: Center(
                          child: Text(
                              widget._value.amountOfItemsInBasket.toString(),
                              style: TextStyle(color: Colors.white))),
                      width: 20.0,
                      height: 20.0,
                      decoration: new BoxDecoration(
                          color: Colors.blue, shape: BoxShape.circle)),
                  IconButton(
                    color: Colors.white,
                    iconSize: 45,
                    icon: Icon(Icons.shopping_basket, size: 45),
                    onPressed: () {
                      Navigator.pushNamed(context, "/food_basket");
                    },
                  ),
                ]),
                flex: 1),
          ]),
        ));
  }
}
