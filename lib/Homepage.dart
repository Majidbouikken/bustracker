import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'dart:async';
import 'package:projet_2cp_g5/main.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location/location.dart';


class HomePage extends StatefulWidget {
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.WhiteGrey,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.black87,
          size: 36,
        ),
        title: Text(
          "bustracker",
          style: TextStyle(color: Colors.black87, fontSize: 28),
        ),
      ),
      body: Stack(
        children: <Widget>[

          // TODO: here the Google maps should be implemented
          Image(image: AssetImage('assets/images/MAP.png')),

          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        ThemeColors.WhiteGrey,
                        ThemeColors.TransparentWhiteGrey,
                        ThemeColors.TransparentWhiteGrey,
                        ThemeColors.TransparentWhiteGrey,
                        ThemeColors.TransparentWhiteGrey,
                      ]))),

          /// the Current City nav bar

          Padding(
            padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                        color: ShadowColors.LightShadow,
                        blurRadius: 8,
                        offset: Offset(0, 6))
                  ]),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        color: Colors.white,
                        boxShadow: [
                          new BoxShadow(
                              color: ShadowColors.LightShadow, blurRadius: 10)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.pin_drop,
                        color: ThemeColors.mainRed,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Alger, Algérie",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xfff95149)),
                  )
                ],
              ),
            ),
          ),

          /// here i implemented the ControlBar

          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Padding(
                padding: const EdgeInsets.only(bottom: 40, left: 20, right: 20),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Image(image: AssetImage('assets/images/ControllBar.png')),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.transparent,
                          /*gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                ThemeColors.gradientOrange,
                                ThemeColors.gradientRed,
                                ThemeColors.gradientMagenta,
                              ]),*/
                          boxShadow: [
                            BoxShadow(
                                color: ShadowColors.RedShadow,
                                blurRadius: 8,
                                offset: Offset(0, 6))
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.black38,
                                size: 20,
                              ),
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onPressed: () {}),
                          IconButton(
                              icon: Icon(
                                Icons.flag,
                                color: Colors.black38,
                                size: 20,
                              ),
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onPressed: () {}),
                          SizedBox(width: 46),
                          IconButton(
                              icon: Icon(
                                Icons.map,
                                color: Colors.black38,
                                size: 20,
                              ),
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onPressed: () {}),
                          IconButton(
                              icon: Icon(
                                Icons.bookmark,
                                color: Colors.black38,
                                size: 20,
                              ),
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onPressed: () {}),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 7.5),
                      child: Container(
                          height: 42,
                          width: 42,
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Colors.white, width: 3.5),
                              borderRadius: BorderRadius.circular(40),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    ThemeColors.gradientSemiOrange,
                                    ThemeColors.gradientRed,
                                    ThemeColors.gradientSemiMagenta,
                                  ])),
                          child: FloatingActionButton(
                            onPressed: main,
                            backgroundColor: Color(0x00FFFFFF),
                            elevation: 0,
                          )),
                    )
                  ],
                )),
          )
        ],
      ),

      /// here i implemented the drawer

      drawer: Drawer(
          elevation: 0,
          child: Container(
            color: ThemeColors.WhiteGrey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 32,
                  ),
                  Center(
                    heightFactor: 1.49,
                    child: Column(
                      children: <Widget>[
                        Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    ThemeColors.gradientPureMagenta,
                                    ThemeColors.gradientRed,
                                    ThemeColors.gradientPureOrange,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(37),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0x77f95149),
                                      offset: Offset(0, 3),
                                      blurRadius: 8)
                                ]),
                            child: Padding(
                                padding: EdgeInsets.all(4),
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/photo de profile.png'),
                                          fit: BoxFit.cover),
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(33)),
                                ))),
                        Text(User.getPrenom() + " " + User.getNom(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                        SizedBox(
                          height: 2,
                        ),
                        Text(User.getAdresseMail(),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.body2),
                      ],
                    ),
                  ),

                  /// here i implemented the two main drawer buttons

                  Row(
                    children: <Widget>[
                      Expanded(
                          child: RaisedButton(
                            color: Colors.white,
                            splashColor: ThemeColors.highlightedOrange,
                            highlightColor: Colors.transparent,
                            highlightElevation: 1,
                            child: Container(
                              margin: EdgeInsets.only(top: 12, bottom: 16),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                        color: Colors.white,
                                        boxShadow: [
                                          new BoxShadow(
                                              color: ShadowColors.LightShadow,
                                              blurRadius: 5)
                                        ]),
                                    child: Material(
                                      color: Colors.white,
                                      elevation: 3,
                                      shadowColor: ShadowColors.RegularShadow,
                                      borderRadius: BorderRadius.circular(100),
                                      child: Padding(
                                          padding: EdgeInsets.all(4),
                                          child: Icon(
                                            Icons.link,
                                            color: ThemeColors.analogousOrange,
                                            size: 22,
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'Lignes disponibles',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: ThemeColors.analogousOrange,
                                        fontFamily: 'Oxygen',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed("/MenuMesLignesDisponibles");
                            },
                          )),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: RaisedButton(
                            color: Colors.white,
                            splashColor: ThemeColors.highlightedMagenta,
                            highlightColor: Colors.transparent,
                            highlightElevation: 1,
                            child: Container(
                              margin: EdgeInsets.only(top: 12, bottom: 16),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                        color: Colors.white,
                                        boxShadow: [
                                          new BoxShadow(
                                              color: ShadowColors.LightShadow,
                                              blurRadius: 5)
                                        ]),
                                    child: Material(
                                      color: Colors.white,
                                      elevation: 3,
                                      shadowColor: ShadowColors.RegularShadow,
                                      borderRadius: BorderRadius.circular(100),
                                      child: Padding(
                                          padding: EdgeInsets.all(4),
                                          child: Icon(
                                            Icons.settings,
                                            color: ThemeColors.analogousMagenta,
                                            size: 22,
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'Options',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: ThemeColors.analogousMagenta,
                                        fontFamily: 'Oxygen',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed("/MenuOptions");
                            },
                          )),
                    ],
                  ),

                  SizedBox(
                    height: 8,
                  ),

                  /// here i implemented the Aide, Guide a l'usage and apropos de nous buttons

                  Card(
                    elevation: 2,
                    margin: EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        FlatButton(
                          highlightColor: ThemeColors.WhiteGrey,
                          materialTapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Aide et comentaires',
                                style: TextStyle(fontSize: 12),
                              ),
                              Expanded(child: SizedBox())
                            ],
                          ),
                          onPressed: main,
                        ),
                        FlatButton(
                          highlightColor: ThemeColors.WhiteGrey,
                          materialTapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Guide a l'usage",
                                style: TextStyle(fontSize: 12),
                              ),
                              Expanded(child: SizedBox())
                            ],
                          ),
                          onPressed: main,
                        ),
                        FlatButton(
                          highlightColor: ThemeColors.WhiteGrey,
                          materialTapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                          child: Row(
                            children: <Widget>[
                              Text(
                                'A propos de nous',
                                style: TextStyle(fontSize: 12),
                              ),
                              Expanded(child: SizedBox())
                            ],
                          ),
                          onPressed: main,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 8,
                  ),

                  /// here is the deconnexion button

                  Card(
                    elevation: 2,
                    margin: EdgeInsets.all(0),
                    child: FlatButton(
                      highlightColor: ThemeColors.WhiteGrey,
                      splashColor: Colors.transparent,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.reply,
                            size: 16,
                          ),
                          SizedBox(width: 12),
                          Text(
                            'Déconnexion',
                            style: TextStyle(fontSize: 12),
                          ),
                          Expanded(child: SizedBox())
                        ],
                      ),
                      onPressed: main,
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
