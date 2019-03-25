import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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
        home: new LogInPage(),
        theme: new ThemeData(
          primaryColor: Color(0xfff95149),
          textTheme: Theme.of(context).textTheme.copyWith(
                title: new TextStyle(
                    color: Colors.black87,
                    fontFamily: 'Oxygen',
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
                body1: new TextStyle(
                    color: mediumGrey, fontFamily: 'Oxygen', fontSize: 14),
                body2: new TextStyle(
                    color: mediumGrey, fontFamily: 'Montserrat', fontSize: 11),
                headline: new TextStyle(
                    color: Colors.black, fontFamily: 'Oxygen', fontSize: 18),
                //
                subhead: new TextStyle(
                    color: mainRed,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 16),

                /// i used this in Fieled Texts in TextFields
                display1: new TextStyle(
                    color: Colors.black87,
                    fontFamily: 'Oxygen',
                    fontSize: 18),

                /// i used this in hintTexts in TextFields
                display2: new TextStyle(
                    color: mediumGrey,
                    fontFamily: 'Oxygen',
                    fontSize: 18),
              ),
        ),
        routes: <String, WidgetBuilder>{
          "/HomePage": (BuildContext context) => new HomePage(),
          "/SignUpPage": (BuildContext context) => new SignUpPagePage(),
          "/MenuOptions": (BuildContext context) => new MenuOptions(),
          "/MenuMesLignesDisponibles": (BuildContext context) => new MesLignes(),
          "/LogIn": (BuildContext context) => new LogInPage(),
        });
  }
}

// TODO: replace the shadow of material and container with just container in main drawer buttons, lignes dispo ... etc
// TODO: add icons

// Colors
var mainRed = Color(0xfff95149);

var complementaryBlue = Color(0xFF00CCF3);
var highlightedBlue = Color(0xFFD8FAFF);

var analogousOrange = Color.fromARGB(255, 254, 170, 44);
var highlightedOrange = Color(0xFFFFF3E0);
var analogousMagenta = Color(0xFFFE2C80);
var highlightedMagenta = Color(0xFFFFE4ED);

var lightGrey = Color(0xfff5f5f5);
var mediumGrey = Color(0xff9c9c9c);
var darkGrey = Color(0xff606060);

//Réglages
var VilleActuelle = 'Alger, Algérie';
var ValeurRayon = 400.0;

class ThemeColors {
  static const Color gradientPureOrange = Color(0xFFFFAD2C);
  static const Color gradientOrange = Color(0xFFFB6145);
  static const Color gradientRed = Color(0xFFFB4F4F);
  static const Color gradientMagenta = Color(0xFFFC455C);
  static const Color gradientPureMagenta = Color(0xFFFF2C7C);
}

class ColorsSocial{
  static const Color facebook = Color(0xFF3B5998);

}

class User{
  static String AdresseMail ;
  static String NumTel ;
  static String Nom ;
  static String Prenom;
  static String Pass ;
  static int Rayon ;
  // just some setters and getters
  static void setAdresseMail(String value){AdresseMail = value;}
  static String getAdresseMail(){return AdresseMail;}
  static void setNumTel(String value){NumTel = value;}
  static String getNumTel(){return NumTel;}
  static void setNom(String value){Nom = value;}
  static String getNom(){return Nom;}
  static void setPrenom(String value){Prenom = value;}
  static String getPrenom(){return Prenom;}
  static void setPass(String value){Pass = value;}
  static String getPass(){return Pass;}
  static void setRayon(int value){Rayon = value;}
  static int getRayon(){return Rayon;}
}
