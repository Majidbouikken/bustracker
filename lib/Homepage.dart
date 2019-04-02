import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:projet_2cp_g5/main.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  GoogleMapController myController;

  Map<String, double> currentLocation = new Map();

  StreamSubscription<Map<String, double>> locationSubscription;

  Location location = new Location();
  String error;

  @override
  bool mapToggle = true;

  String mess;
  bool completed = false;
  bool exist = true;

  void initState() {
    super.initState();
    currentLocation['latitude'] =
        36.7525000; // initial values but right values after executing this function.
    currentLocation['longitude'] = 3.0419700;
    initPlatformState();
    locationSubscription =
        location.onLocationChanged().listen((Map<String, double> result) {
      setState(() {
        currentLocation = result;
      });
    });
  }

/*
  void initState() {
    super.initState();
    gestion g = new gestion();
    g.module().then((m) {
      mess = m;
    }).whenComplete(() {
      completed = true;
      setState(() {
      });
    });
  }
  */

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
          Container(
              height: MediaQuery.of(context).size.height - 80.0,
              width: double.infinity,
              child: mapToggle
                  ? GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(36.6993, 3.1755),
                        zoom: 10.0,
                      ),
                      onMapCreated: onMapCreated,
                      myLocationEnabled: true,
                      markers: Set<Marker>.of(
                        <Marker>[
                          Marker(
                            draggable: true,
                            markerId: MarkerId("1"),
                            //         position: LatLng(currentLocation['latitude'], currentLocation['longitude']),
                            icon: BitmapDescriptor.defaultMarker,
                            alpha: 0.5,
                          )
                        ],
                      ),
                    )
                  : Center(
                      child: Text(
                        'Veuillez Patientez..',
                        style: TextStyle(color: Colors.black87, fontSize: 28),
                      ),
                    )),
          /*        Container(
            child: completed
                ? AlertDialog(
              title: new Text("Vous êtes actuellement dans"),
              content: new Text("${mess}"),
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("Accéder à la station"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ) : Text('')
          ),  */

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
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xfff95149)),
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

// To control the map
  void onMapCreated(controller) {
    setState(() {
      myController = controller;
    });
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
      mapToggle = true;
    });
  }
}

class gestion {
  static bool
      existe_arret; //Variable globale pour preciser si il existe un arret proche ou pas
  static String name_ligne = "vide"; //Variable globale pour nom de la ligne
  static String name_arret = "vide"; //Variable globale pour nom d'arret

  static double x_user = 70.41; //X de User
  static double y_user = 10.0; // Y de User
  static double rayon_arret =
      1; // le rayon de l'arret pour prendre cest User est dans l'arret ou pas (metre)

  Future<String> module() async {
    String mess;
    existe_arret = false;
    await Firestore.instance
        .collection("/lignes")
        .getDocuments()
        .then((data) async {
      int max = data
          .documents.length; //calcul le nombre des lignes maximal est nb_docs
      int i = 1;

      while ((i <= max) && (existe_arret == false)) {
        //parcour de tous les lignes

        await Firestore.instance
            .collection("/lignes")
            .where("ligneID", isEqualTo: i)
            .getDocuments()
            .then((lignes) async {
          if (lignes.documents.isNotEmpty) {
            var ligne = lignes.documents
                .first; //selectionner le ligne de ID numero i dans la BDD

            name_ligne = ligne.data['direction']; //la direction de la ligne
            int nb_arret =
                ligne.data['nb_arrets']; //le nombre d'arrets dans la ligne

            int j = 1;

            while ((j <= nb_arret) && (existe_arret == false)) {
              //Parcour de tous les arrets de la ligne
              var Arrets = Firestore.instance
                  .collection("/lignes/" + ligne.documentID + "/arrets de bus")
                  .where("arretID", isEqualTo: j);
              await Arrets.getDocuments().then((arretss) async {
                if (arretss.documents.isNotEmpty) {
                  var arret = arretss
                      .documents.first; //generer un arret apres la recherche

                  name_arret = arret.data['nom']; //nom de l'arret
                  double x = arret.data['latitude']; //X de l'arret
                  double y = arret.data['longitude']; // Y de l'arret
                  double dis = distance(x, y, x_user,
                      y_user); //calcule de la dustance entre la position de User et l'arret generer parla boucle

                  if (dis <= rayon_arret) {
                    mess = "La ligne :" +
                        name_ligne +
                        " \n\nLa station: " +
                        name_arret;
                    existe_arret = true;
                  } else {
                    mess =
                        "Pas d arret dans le rayon actuel"; //affichage pour le cas ou y'a pas d'arret

                  }
                }
              }).catchError((e) {});
              j++;
            }
          }
        }).catchError((e) {});

        i++;
      }
    });
    setexist(existe_arret);
    return mess;
  }

  double distance(x1, y1, x2, y2) {
    var dx = x1 - x2;
    var dy = y1 - y2;
    return sqrt(dx * dx + dy * dy) * 1000;
  }

  static bool getexist() {
    return existe_arret;
  }

  static void setexist(bool value) {
    existe_arret = value;
  }
}
