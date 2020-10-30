import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(TestQr());
}

class TestQr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var rng = new Random();
    double idrzfese = rng.nextDouble();
    print(idrzfese);

    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: QrImage(
            data: "www.remyvancraeyveldt.be",
            version: QrVersions.auto,
            size: 200,
          ),
        ),
      ),
    );
  }
}
