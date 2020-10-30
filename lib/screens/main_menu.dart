import 'package:flutter/material.dart';

import '../common/logo.dart';
import '../services/auth.dart';

class MainMenu extends StatefulWidget {
  MainMenu({Key key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: Container(
            color: Colors.blue[300],
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 65, height: 50.0),
                    Logo.chooseSize(200.0, 70.0),
                    IconButton(
                        iconSize: 50,
                        icon: Icon(Icons.exit_to_app, size: 50.0),
                        onPressed: () async {
                          await _auth.signOut();
                          Navigator.pushNamed(context, '/signin');
                        })
                  ],
                ),
                SizedBox(height: 40),
                Container(
                    height: 400,
                    color: Colors.red,
                    width: MediaQuery.of(context).size.width - 20,
                    child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 100,
                              child: RaisedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, "/food_categories");
                                  },
                                  child: Text('Commande',
                                      style: TextStyle(fontSize: 35))),
                            ),
                            Container(
                              width: double.infinity,
                              height: 100,
                              child: RaisedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, "/food_favorites");
                                  },
                                  child: Text('Commande Rapide',
                                      style: TextStyle(fontSize: 35))),
                            ),
                            Container(
                              width: double.infinity,
                              height: 100,
                              child: RaisedButton(
                                  onPressed: () {
                                    // Navigator.pushNamed(
                                    //     context, "/food_categories");
                                  },
                                  child: Text('Historique',
                                      style: TextStyle(fontSize: 35))),
                            ),
                          ]),
                    ))
              ],
            )),
      ),
    );
  }
}
