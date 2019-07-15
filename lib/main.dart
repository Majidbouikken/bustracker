import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flare_flutter/flare_actor.dart';
import 'package:projet_2cp_g5/LogInPage.dart';
import 'package:projet_2cp_g5/SignUpPage.dart';
import 'package:projet_2cp_g5/Homepage.dart';
import 'package:projet_2cp_g5/Menuoptions.dart';
import 'package:projet_2cp_g5/Menulignesdisponibles.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new SplashScreen(),
        theme: new ThemeData(
          primaryColor: Color(0xfff95149),
          textTheme: Theme.of(context).textTheme.copyWith(
                title: new TextStyle(
                    color: Colors.black87,
                    fontFamily: 'Oxygen',
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
                body1: new TextStyle(
                    color: ThemeColors.mediumGrey,
                    fontFamily: 'Oxygen',
                    fontSize: 14),
                body2: new TextStyle(
                    color: ThemeColors.mediumGrey,
                    fontFamily: 'Montserrat',
                    fontSize: 11),
                headline: new TextStyle(
                    color: Colors.black, fontFamily: 'Oxygen', fontSize: 18),
                //
                subhead: new TextStyle(
                    color: ThemeColors.mainRed,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 16),

                /// i used this in Fieled Texts in TextFields
                display1: new TextStyle(
                    color: Colors.black87, fontFamily: 'Oxygen', fontSize: 18),

                /// i used this in hintTexts in TextFields
                display2: new TextStyle(
                    color: ThemeColors.mediumGrey,
                    fontFamily: 'Oxygen',
                    fontSize: 18),
              ),
        ),
        routes: <String, WidgetBuilder>{
          "/WelcomeScreen": (BuildContext context) => new WelcomeScreen(),
          "/HomePage": (BuildContext context) => new HomePage(),
          "/SignUpPage": (BuildContext context) => new SignUpPagePage(),
          "/MenuOptions": (BuildContext context) => new MenuOptions(),
          "/MenuMesLignesDisponibles": (BuildContext context) =>
              new MesLignes(),
          "/LogIn": (BuildContext context) => new LogInPage(),
          "/Stations": (BuildContext context) => new StationList(),
          "/Lignes": (BuildContext context) => new LigneList(),
        },
        debugShowCheckedModeBanner: false);
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State createState() {
    return new SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(
          seconds: 3,
        ), () {
      Navigator.of(context).pushReplacementNamed('/WelcomeScreen');
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        body: GestureDetector(
      onDoubleTap: () {
        Navigator.of(context).pushReplacementNamed('/WelcomeScreen');
      },
      child: FlareActor(
        "assets/animations/BusTracker_SplshScrn.flr",
        animation: "Start",
      ),
    ));
  }
}

class WelcomeScreen extends StatefulWidget {
  @override
  State createState() {
    return new WelcomeScreenState();
  }
}

class WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        body: Stack(
      children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/logo.png',
                  width: 80,
                ),
                SizedBox(
                  height: 32,
                ),
                Text(
                  '''Bienvenue à Bustracker''',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                      fontSize: 28),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  '''Votre plateforme de services en ligne pour les lignes des bus préférée.''',
                  style: TextStyle(
                      color: ThemeColors.mediumGrey,
                      fontFamily: 'Oxygen',
                      fontSize: 13),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 64,
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width - 64,
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
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: FlatButton(
                      splashColor: Color(0x25FFDDDD),
                      highlightColor: Colors.transparent,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onPressed: () {
                        Navigator.of(context).pushNamed('/LogIn');
                      },
                      child: Text(
                        "S'authentifier",
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
              Container(
                width: MediaQuery.of(context).size.width - 64,
                height: 52,
                decoration: BoxDecoration(
                  border: Border.all(color: ThemeColors.mainRed, width: 2),
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: FlatButton(
                      splashColor: Color(0x75FFDDDD),
                      highlightColor: Colors.transparent,
                      clipBehavior: Clip.hardEdge,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onPressed: () {
                        Navigator.of(context).pushNamed("/SignUpPage");
                      },
                      child: Text(
                        "Créer un compte",
                        style: new TextStyle(
                            color: ThemeColors.mainRed,
                            fontFamily: 'Oxygen',
                            fontSize: 16),
                      )),
                ),
              ),
              SizedBox(
                height: 32,
              ),
            ],
          ),
        )
      ],
    ));
  }
}

// TODO: replace the shadow of material and container with just container in main drawer buttons, lignes dispo ... etc
// TODO: add icons

// Colors
class ThemeColors {
  static const Color mainRed = Color(0xfff95149);

  static const Color complementaryBlue = Color(0xFF00CCF3);
  static const Color highlightedBlue = Color(0xFFD8FAFF);

  static const Color analogousOrange = Color.fromARGB(255, 254, 170, 44);
  static const Color highlightedOrange = Color(0xFFFFF3E0);
  static const Color analogousMagenta = Color(0xFFFE2C80);
  static const Color highlightedMagenta = Color(0xFFFFE4ED);

  static const Color WhiteGrey = Color.fromARGB(255, 247, 247, 247);
  static const Color TransparentWhiteGrey = Color.fromARGB(0, 247, 247, 247);
  static const Color lightGrey = Color(0xfff0f0f0);
  static const Color mediumGrey = Color(0xff9c9c9c);
  static const Color darkGrey = Color(0xff606060);

  static const Color gradientPureOrange = Color(0xFFFFAD2C);
  static const Color gradientSemiOrange = Color(0xFFFC743F);
  static const Color gradientOrange = Color(0xFFFB6145);
  static const Color gradientRed = Color(0xFFFB4F4F);
  static const Color gradientMagenta = Color(0xFFFC455C);
  static const Color gradientSemiMagenta = Color(0xFFFC4260);
  static const Color gradientPureMagenta = Color(0xFFFF2C7C);
}

class ShadowColors {
  static const Color VeryLightShadow = Color.fromARGB(10, 0, 0, 0);
  static const Color LightShadow = Color.fromARGB(30, 0, 0, 0);
  static const Color MediumShadow = Color.fromARGB(60, 0, 0, 0);
  static const Color RegularShadow = Color.fromARGB(130, 0, 0, 0);

  static const Color RedShadow = Color(0xCCf95149);

  static const Color facebookShadow = Color(0xCC3B5998);
}

class ColorsSocial {
  static const Color facebook = Color(0xFF3B5998);
}

//Réglages
var VilleActuelle = 'Alger, Algérie';

class User {
  static String AdresseMail;

  static String NumTel;

  static String Nom;

  static String Prenom;
  static String Pass;

  static double Rayon;

  static String ID;
  static String DocID;
  static double long;
  static double lat;
  static bool exist;

  // just some setters and getters
  static void setAdresseMail(String value) {
    AdresseMail = value;
  }

  static String getAdresseMail() {
    return AdresseMail;
  }

  static void setID(String value) {
    ID = value;
  }

  static String getID() {
    return ID;
  }

  static void setNumTel(String value) {
    NumTel = value;
  }

  static String getNumTel() {
    return NumTel;
  }

  static void setNom(String value) {
    Nom = value;
  }

  static String getNom() {
    return Nom;
  }

  static void setPrenom(String value) {
    Prenom = value;
  }

  static String getPrenom() {
    return Prenom;
  }

  static void setPass(String value) {
    Pass = value;
  }

  static String getPass() {
    return Pass;
  }

  static void setRayon(double value) {
    Rayon = value;
  }

  static double getRayon() {
    return Rayon;
  }

  static void setDocID(String value) {
    DocID = value;
  }

  static String getDocID() {
    return DocID;
  }

  static void setLong(double value) {
    long = value;
  }

  static double getLong() {
    return long;
  }

  static void setLat(double value) {
    lat = value;
  }

  static double getLat() {
    return lat;
  }

  static void setExist(bool value) {
    exist = value;
  }

  static bool getExist() {
    return exist;
  }
}
