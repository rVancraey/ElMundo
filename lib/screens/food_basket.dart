import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/header.dart';
import '../common/quantity_module.dart';
import '../models/food_catalog.dart';

class FoodBasket extends StatefulWidget {
  FoodBasket({Key key}) : super(key: key);

  @override
  _FoodBasketState createState() => _FoodBasketState();
}

class _FoodBasketState extends State<FoodBasket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<FoodCatalog>(
          builder: (BuildContext context, FoodCatalog value, Widget child) {
        return Container(
          color: Colors.orangeAccent,
          child: Column(children: [
            Header(value),
            Text("Panier :", textAlign: TextAlign.left),
            Container(
              color: Colors.white,
              height: 400.0,
              width: MediaQuery.of(context).size.width - 20,
              child: ListView.separated(
                itemCount: value.foodBasket.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 50.0,
                    child: ListTile(
                        leading: Icon(Icons.fastfood,
                            color: Colors.primaries[
                                Random().nextInt(Colors.primaries.length)]),
                        title: Text(value.getItemFromBasket(index).name),
                        subtitle: Text(value
                            .getItemFromBasket(index)
                            .ingredientsNamesShort),
                        trailing: QuantityModule(
                            value.getItemFromBasket(index), index, value)),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(color: Colors.orangeAccent, thickness: 5.0);
                },
              ),
            ),
            Container(
                child: Column(
              children: [
                Container(
                    alignment: Alignment.centerRight,
                    height: 40,
                    width: MediaQuery.of(context).size.width - 20,
                    child: Container(
                        width: 150,
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Center(
                                child: Text("Prix :",
                                    style: TextStyle(fontSize: 22))),
                            Text(value.totalPrice.toString(),
                                style: TextStyle(fontSize: 32))
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 2),
                        ))),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 60.0,
                        width: 140,
                        color: Colors.red,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.red)),
                            onPressed: () {
                              value.emptyBasket();
                            },
                            child: Text("Vider le Panier",
                                style: TextStyle(color: Colors.white))),
                      ),
                      Container(
                        height: 60.0,
                        width: 245,
                        color: Colors.green,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.green)),
                            onPressed: () {
                              showDialog(
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Confirmation'),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: <Widget>[
                                          Text(
                                              'Êtes-vous sûr de vouloir confirmer cette commande ? '),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text('Annuler'),
                                        onPressed: () {},
                                      ),
                                      TextButton(
                                        child: Text('Confirmer'),
                                        onPressed: () {},
                                      ),
                                    ],
                                  );
                                },
                                context: context,
                              );
                            },
                            child: Text("Confirmer la commande",
                                style: TextStyle(color: Colors.white))),
                      )
                    ])
              ],
            ))
          ]),
        );
      }),
    );
  }
}
