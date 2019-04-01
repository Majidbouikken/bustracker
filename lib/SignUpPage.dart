import 'package:flutter/material.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'UserManagement.dart';

class SignUpPagePage extends StatefulWidget {
  @override
  State createState() => new SignUpPageState();
}

///i tried to implement a stepper in the Sign Up Page for a good looking page

class SignUpPageState extends State<SignUpPagePage> {

  bool _autoValidate = false;
  final _formKey = GlobalKey<FormState>();
  String _email,_password,_nom,_prenom,_mobile;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // Body
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Form(
          key: _formKey,
          autovalidate: _autoValidate,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Inscription",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontSize: 28),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              width: 1080,
              height: 42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: lightGrey,
              ),
              child: Center(
                child: TextField(
                  keyboardType: TextInputType.text,
                  onChanged: (String value) {
                    User.setPrenom(value);
                  },
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle),
                    border: InputBorder.none,
                    hintText: "Prénom",
                    hintStyle: Theme.of(context).textTheme.display2,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: 1080,
              height: 42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: lightGrey,
              ),
              child: Center(
                child: TextField(
                  keyboardType: TextInputType.text,
                  onChanged: (String value) {
                    User.setNom(value);
                  },
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle),
                    border: InputBorder.none,
                    hintText: "Nom",
                    hintStyle: Theme.of(context).textTheme.display2,
                  ),
                ),
              ),

            ),
          //TODO : FIX THE DIMENSION FOR THE PHONE NUMBER PLACE
            SizedBox(
              height: 16,
            ),
            Container(
              width: 1080,
              height: 42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: lightGrey,
              ),
              child: Center(
                child: TextField(
                  keyboardType: TextInputType.phone,
                  onChanged: (String value) {
                    User.setNumTel(value);
                  },
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    border: InputBorder.none,
                    hintText: "Numéro de téléphone",
                    hintStyle: Theme.of(context).textTheme.display2,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: 1080,
              height: 42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: lightGrey,
              ),
              child: Center(
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (String value) {
                   _email=value;
                  },
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    border: InputBorder.none,
                    hintText: "Adresse mail",
                    hintStyle: Theme.of(context).textTheme.display2,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: 1080,
              height: 42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: lightGrey,
              ),
              child: Center(
                child: TextField(
                  onChanged: (String value) {
                    User.setPass(value);
                    _password=value;
                  },
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.verified_user),
                    border: InputBorder.none,
                    hintText: "Mot de passe",
                    hintStyle: Theme.of(context).textTheme.display2,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: 1080,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: LinearGradient(
                  colors: [
                    ThemeColors.gradientOrange,
                    ThemeColors.gradientRed,
                    ThemeColors.gradientMagenta,
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xCCf95149),
                      offset: Offset(0, 3),
                      blurRadius: 10)
                ],
              ),
              child: FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onPressed: () {
                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: _email,
                        password: _password,
                    ).then((signedInUser) {
                      signedInUser.sendEmailVerification();
                      UserManagement().storeNewUser(signedInUser,context);
                    }
                    ).catchError((e){
                      print(e);
                    });
                  },
                  child: Text(
                    "S'INSCRIRE",
                    style: new TextStyle(
                        color: Colors.white,
                        fontFamily: 'Oxygen',
                        fontSize: 16),
                  )),
            ),
          ],
        ),
        ),
      ),
    );
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
      _formKey.currentState.save();
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }

  String validateNom(String value)  {
    if (value.length < 3)
      return 'Le nom doit contenir au moins 3 caractères';
    else
      return null;
  }

  String validatePrenom(String value) {
    if (value.length < 3)
      return 'Le prénom doit contenir au moins 3 caractères';
    else
      return null;
  }

  String validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 10)
      return 'Le  numéro doit contenir 10 caractères.';
    else
      return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Entrez une adresse valide';
    else
      return null;
  }

  String validatePass(String value) {
    if (value.length < 6)
      return 'Mot de passe incorrecte.';
    else
      return null;
  }
}
