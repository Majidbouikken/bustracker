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
          primaryColor: ThemeColors.mainRed,
          textTheme: Theme.of(context).textTheme.copyWith(
            title: new TextStyle(
                color: Colors.black87,
                fontFamily: 'Oxygen',
                fontWeight: FontWeight.bold,
                fontSize: 24),
            body1: new TextStyle(
                color: ThemeColors.mediumGrey, fontFamily: 'Oxygen', fontSize: 14),
            body2: new TextStyle(
                color: ThemeColors.mediumGrey, fontFamily: 'Montserrat', fontSize: 11),
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
                color: Colors.black87,
                fontFamily: 'Oxygen',
                fontSize: 18),

            /// i used this in hintTexts in TextFields
            display2: new TextStyle(
                color: ThemeColors.mediumGrey,
                fontFamily: 'Oxygen',
                fontSize: 18),
          ),
        ),
        routes: <String, WidgetBuilder>{
          "/HomePage": (BuildContext context) => new HomePage(),
          "/SignUpPage": (BuildContext context) => new SignUpPagePage(),
          "/MenuOptions": (BuildContext context) => new MenuOptions(),
          "/MenuMesLignesDisponibles": (BuildContext context) =>
          new MesLignes(),
        });
  }
}

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
  static const Color RegularShadow = Color.fromARGB(130, 0, 0, 0);

  static const Color RedShadow = Color(0xCCf95149);

}

class ColorsSocial{
  static const Color facebook = Color(0xFF3B5998);

}

//Réglages
var VilleActuelle = 'Oran, Algérie';
var ValeurRayon = 600.0;


//User class
class User{
  static String AdresseMail = 'ha_bouikken_bahi_amar@esi.dz';
  static String NumTel = '+213560834326';
  static String Nom = 'Bouikken';
  static String Prenom = 'Abdelmajid';
  // just some setters and getters
  static void setAdresseMail(String value){AdresseMail = value;}
  static String getAdresseMail(){return AdresseMail;}
  static void setNumTel(String value){NumTel = value;}
  static String getNumTel(){return NumTel;}
  static void setNom(String value){Nom = value;}
  static String getNom(){return Nom;}
  static void setPrenom(String value){Prenom = value;}
  static String getPrenom(){return Prenom;}
}