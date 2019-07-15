import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class LogInPage extends StatefulWidget {
  @override
  State createState() {
    return new LogInPageState();
  }
}

class LogInPageState extends State<LogInPage> {
  String _email, _password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Map<String, double> currentLocation = new Map();

  StreamSubscription<Map<String, double>> locationSubscription;

  Location location = new Location();
  String error;

  //Google Sign in

  GoogleSignIn googleAuth = new GoogleSignIn();

  //Facebook Sign in

  FacebookLogin fblogin = new FacebookLogin();

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    CircularProgressIndicator();
    if (validateAndSave()) {
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);

        // Retrieving User's DATA
        User.setAdresseMail(user.email);
        User.setID(user.uid);

        var Nom = await Firestore.instance
            .collection('users')
            .where('User_ID', isEqualTo: user.uid)
            .getDocuments();
        String nom = Nom.documents[0].data['Nom'];
        User.setNom(nom);

        var Prenom = await Firestore.instance
            .collection('users')
            .where('User_ID', isEqualTo: user.uid)
            .getDocuments();
        String prenom = Prenom.documents[0].data['Prenom'];
        User.setPrenom(prenom);

        var Numtel = await Firestore.instance
            .collection('users')
            .where('User_ID', isEqualTo: user.uid)
            .getDocuments();
        String numero = Numtel.documents[0].data['NumTel'];
        User.setNumTel(numero);

        var Rayon = await Firestore.instance
            .collection('users')
            .where('User_ID', isEqualTo: user.uid)
            .getDocuments();
        double rayon = Rayon.documents[0].data['RayonActuel'].toDouble();
        User.setRayon(rayon.toDouble());

        var DocRef = await Firestore.instance
            .collection('users')
            .where('User_ID', isEqualTo: user.uid)
            .getDocuments();
        String docref = DocRef.documents[0].data['DocID'];
        User.setDocID(docref);
        print('heeeeeeeeere');

        var Pass = await Firestore.instance
            .collection('users')
            .where('User_ID', isEqualTo: user.uid)
            .getDocuments();
        String password = Pass.documents[0].data['Password'];
        User.setPass(password);

        Navigator.of(context).pushReplacementNamed("/HomePage");
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  void initState() {
    super.initState();
    currentLocation['latitude'] =
        36.8525000; // initial values but right values after executing this function.
    currentLocation['longitude'] = 3.0419700;
    initPlatformState();
    locationSubscription =
        location.onLocationChanged().listen((Map<String, double> result) {
      setState(() {
        currentLocation = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Connexion",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontSize: 28),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 52,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: ThemeColors.lightGrey,
                ),
                child: Center(
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      Pattern pattern =
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                      RegExp regex = new RegExp(pattern);
                      if (!regex.hasMatch(value))
                        return 'Entrez une adresse valide!';
                      else
                        return null;
                    },
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        color: Colors.black87),
                    cursorColor: ThemeColors.mainRed,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        FontAwesomeIcons.userAlt,
                        size: 18,
                      ),
                      border: InputBorder.none,
                      hintText: "Adresse mail",
                      hintStyle: Theme.of(context).textTheme.display2,
                    ),
                    onSaved: (input) {
                      setState(() {
                        _email = input;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 52,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: ThemeColors.lightGrey,
                ),
                child: Center(
                  child: TextFormField(
                    validator: (value) {
                      if (value.length < 6)
                        return 'Mot de passe incorrecte';
                      else
                        return null;
                    },
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        color: Colors.black87),
                    obscureText: true,
                    cursorColor: ThemeColors.mainRed,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        FontAwesomeIcons.key,
                        size: 18,
                      ),
                      border: InputBorder.none,
                      hintText: "Mot de passe",
                      hintStyle: Theme.of(context).textTheme.display2,
                    ),
                    onSaved: (input) {
                      setState(() {
                        _password = input;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 52,
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
                        color: ShadowColors.RedShadow,
                        blurRadius: 6,
                        offset: Offset(0, 4))
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: FlatButton(
                      splashColor: Color(0x25FFDDDD),
                      highlightColor: Colors.transparent,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onPressed: validateAndSubmit,
                      child: Text(
                        "SE CONNECTER",
                        style: new TextStyle(
                            color: Colors.white,
                            fontFamily: 'Oxygen',
                            fontSize: 16),
                      )),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 52,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: ColorsSocial.facebook,
                        boxShadow: [
                          BoxShadow(
                              color: ShadowColors.facebookShadow,
                              blurRadius: 6,
                              offset: Offset(0, 4))
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: FlatButton(
                            splashColor: Color(0x25DDDDFF),
                            highlightColor: Colors.transparent,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            onPressed: () {
                              fblogin.logInWithReadPermissions(
                                  ['email', 'public_profile']).then((result) {
                                switch (result.status) {
                                  case FacebookLoginStatus.loggedIn:
                                    print('EEEEEEEEE');
                                    FirebaseAuth.instance
                                        .signInWithFacebook(
                                      accessToken: result.accessToken.token,
                                    )
                                        .then((signedInUser) {
                                      User.setNom(signedInUser.displayName);
                                      User.setPrenom('');
                                      User.setNumTel('');
                                      User.setAdresseMail(signedInUser.email);
                                      User.setRayon(300.0);
                                      User.setID('');
                                      User.setDocID('');
                                      Navigator.of(context)
                                          .pushReplacementNamed('/HomePage');
                                    }).catchError((e) {
                                      print(e);
                                    });
                                    break;
                                  case FacebookLoginStatus.cancelledByUser:
                                    debugPrint("Facebook Login Canceled!");
                                    break;
                                  case FacebookLoginStatus.error:
                                    debugPrint("Facebook Login Error!" +
                                        result.toString());
                                    break;
                                }
                              }).catchError((e) {
                                print(e);
                              });
                            },
                            child: Row(
                              children: <Widget>[
                                Image(
                                  image: AssetImage(
                                      "assets/images/Facebook_icon.png"),
                                  width: 20,
                                  height: 20,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Facebook",
                                  style: new TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Oxygen',
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      height: 52,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: ShadowColors.LightShadow,
                              blurRadius: 6,
                              offset: Offset(0, 4))
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: FlatButton(
                            splashColor: Color(0x10000000),
                            highlightColor: Colors.transparent,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            onPressed: () {
                              googleAuth.signIn().then((result) {
                                result.authentication.then((googleKey) {
                                  FirebaseAuth.instance
                                      .signInWithGoogle(
                                          idToken: googleKey.idToken,
                                          accessToken: googleKey.accessToken)
                                      .then((signedInUser) {
                                    User.setNom(signedInUser.displayName);
                                    User.setPrenom('');
                                    User.setNumTel('');
                                    User.setAdresseMail(signedInUser.email);
                                    User.setRayon(300.0);
                                    User.setID('');
                                    User.setDocID('');
                                    Navigator.of(context)
                                        .pushReplacementNamed('/HomePage');
                                  }).catchError((e) {
                                    print(e);
                                  });
                                }).catchError((e) {
                                  print(e);
                                });
                              }).catchError((e) {
                                print(e);
                              });
                            },
                            child: Row(
                              children: <Widget>[
                                Image(
                                  image: AssetImage(
                                      "assets/images/Google_icon.png"),
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Google",
                                  style: new TextStyle(
                                      color: Color(0xFF888B8D),
                                      fontFamily: 'Oxygen',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                      child: Text("Inscrivez-vous",
                          style: TextStyle(
                            color: ThemeColors.mainRed,
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                          )),
                      onTap: () {
                        Navigator.of(context).pushNamed("/SignUpPage");
                      }),
                  Text(
                    "  ou  ",
                    style: TextStyle(
                        color: ThemeColors.mediumGrey,
                        fontFamily: 'Montserrat',
                        fontSize: 12),
                  ),
                  GestureDetector(
                      child: Text(
                        "mot de passe oublié?",
                        style: TextStyle(
                            color: ThemeColors.mainRed,
                            fontFamily: 'Montserrat',
                            fontSize: 12),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed("/SignUpPage");
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void initPlatformState() async {
    Map<String, double> my_location;

    try {
      my_location = await location.getLocation();
      error = " ";
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED')
        error = 'Permission denied';
      else if (e.code == 'PERMISSION_DENIED_NEVER_ASK')
        error =
            'Permission denied - please ask the user to enable it from the app settings';
      my_location = null;
    }
    setState(() {
      currentLocation = my_location;
    });
  }
}
