import 'package:flutter/material.dart';

import '../../common/loading.dart';
import '../../services/auth.dart';
import 'authenticate.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUp createState() {
    return _SignUp();
  }
}

class _SignUp extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  bool loading = false;
  String _name;
  String _password;
  String _email;
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : MaterialApp(
            home: Scaffold(
                body: Container(
            color: Color.fromRGBO(25, 59, 49, 0.7),
            height: 900.0,
            child: SingleChildScrollView(
              child: Container(
                  width: 500.0,
                  child: Column(
                    children: [
                      Placeholder(
                          color: Colors.grey,
                          fallbackWidth: 250.0,
                          fallbackHeight: 160.0),
                      Form(
                        key: _formKey,
                        child: _buildFormContainer(),
                      ),
                    ],
                  )),
            ),
          )));
  }

  Widget _buildFormContainer() {
    return Container(
        height: 350.0,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 350.0,
              height: 50.0,
              child: Text("Création d'un compte",
                  style: TextStyle(fontSize: 20.0, color: Colors.white)),
            ),
            Container(child: _buildCredentials()),
            Container(
                width: 350.0,
                alignment: Alignment.centerRight,
                child: RaisedButton(
                    color: Colors.lightGreen,
                    onPressed: () async {
                      if (!_formKey.currentState.validate()) {
                        return;
                      }
                      _formKey.currentState.save();
                      // Navigator.pushNamed(context, "/main_menu");
                      setState(() {
                        loading = true;
                        print("pinte");
                      });
                      dynamic result = await _auth.registerWithEmailAndPassword(
                          _email, _password);

                      if (result == null) {
                        setState(() {
                          error = 'please supply a valid email';
                          loading = false;
                        });

                        print(error);
                      } else {
                        setState(() {
                          loading = false;
                        });
                        showDialog(
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Confirmation'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text(
                                        'Votre demande d\'inscription a bien été enregistrée, vous allez maintenant pouvoir vous connecter.'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Ok'),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Authenticate()));
                                  },
                                ),
                              ],
                            );
                          },
                          context: context,
                        );
                      }
                    },
                    child: Text("Sign Up")))
          ],
        )));
  }

  Widget _buildCredentials() {
    return Container(
        width: 350.0,
        height: 250.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [_buildName(), _buildEmail(), _buildPassword()],
        ));
  }

  Widget _buildPassword() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(labelText: "Mot de passe :"),
      validator: (String value) {
        if (value.isEmpty) {
          return "Mot de passe requis.";
        }
        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Nom :"),
      validator: (String value) {
        if (value.isEmpty) {
          return "Nom requis.";
        }
        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Email :"),
      validator: (String value) {
        if (value.isEmpty) {
          return "Email requis.";
        }
        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }
}
