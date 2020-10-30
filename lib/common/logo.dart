import 'package:flutter/material.dart';

class Logo extends StatefulWidget {
  double _logoWidth = 300.0;
  double _logoHeight = 70.0;
  Logo();
  Logo.chooseSize(this._logoWidth, this._logoHeight);

  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(0),
        height: widget._logoHeight,
        width: widget._logoWidth,
        color: Colors.grey,
        margin: EdgeInsets.all(10),
        child: Center(child: Text("LOGO")));
  }
}
