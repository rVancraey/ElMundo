import 'package:flutter/material.dart';

import '../../common/loading.dart';
import '../../services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignIn createState() {
    return _SignIn();
  }
}

class _SignIn extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String _email;
  String _password;
  bool loading = false;

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
                      // Logo.chooseSize(250, 160),
                      Placeholder(
                          color: Colors.grey,
                          fallbackWidth: 250.0,
                          fallbackHeight: 160.0),
                      Form(
                        key: _formKey,
                        child: _buildFormContainer(),
                      ),
                      _buildNewAccount(),
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
              child: Text("Connectez-vous :",
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
                      setState(() {
                        loading = true;
                      });
                      dynamic result = await _auth.signInWithEmailAndPassword(
                          _email, _password);
                      if (result == null) {
                        print(
                            "Les informations de connexion ne sont pas valides.");
                        setState(() {
                          loading = false;
                        });
                      } else {
                        print("connecté");
                        print(result.uid);
                        Navigator.pushNamed(context, "/main_menu");
                      }
                    },
                    child: Text("Log in")))
          ],
        )));
  }

  Widget _buildCredentials() {
    return Container(
        width: MediaQuery.of(context).size.width - 50,
        height: 200.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [_buildLogin(), _buildPassword()],
        ));
  }

  Widget _buildLogin() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Nom d'utilisateur"),
      validator: (String value) {
        if (value.isEmpty) {
          return "Nom d'utilisateur requis.";
        }
        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Mot de passe"),
      validator: (String value) {
        if (value.isEmpty) {
          return "Mot de passe requis.";
        }
        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
      obscureText: true,
    );
  }

  Widget _buildNewAccount() {
    return Container(
      width: 350.0,
      height: 60.0,
      alignment: Alignment.bottomLeft,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, "/signup");
        },
        child: Text("Vous n'avez pas encore de compte ?",
            style: TextStyle(
                fontSize: 16,
                color: Colors.lightGreen,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
