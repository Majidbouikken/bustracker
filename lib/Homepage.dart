import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

import 'main.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  int i = 0; //this variable is used in the fourth OnPressed function in the ControlBar as a case of condition

  GoogleMapController myController;
  Map<String, double> currentLocation = new Map();

  StreamSubscription<Map<String, double>> locationSubscription;

  Location location = new Location();
  String error;

  @override
  bool mapToggle = true;
  String mess;
  bool completedd = true;
  bool completed = false;
  bool gps = false;
  bool exist = true;

  var stations = [];

  void initState() {
    super.initState();
    popularStations();
    currentLocation['latitude'] =
        36.8525000; // initial values but right values after executing this function.
    currentLocation['longitude'] = 3.0419700;
    initPlatformState();
    locationSubscription =
        location.onLocationChanged().listen((Map<String, double> result) {
      setState(() {
        currentLocation = result;
        gps = true;
      });
    });
    gestion g = new gestion();
    g.module().then((m) {
      mess = m;
      completed = User.getExist();
    }).whenComplete(() {
      setState(() {});
    });
  }

  popularStations() {
    Firestore.instance.collection("/lignes/").getDocuments().then((docs) {
      if (docs.documents.isNotEmpty) {
        for (int i = 0; i < docs.documents.length; i++) {
          Firestore.instance
              .collection(
                  "/lignes/" + docs.documents[i].documentID + "/arrets de bus")
              .getDocuments()
              .then((docs2) {
            for (int j = 0; j < docs2.documents.length; j++) {
              initMarker(docs.documents[i].data, docs2.documents[j].data);
            }
          });
        }
      }
    });
  }

  initMarker(client1, client) {
    myController.clearMarkers().then((val) {
      if (distance(client['latitude'], client['longitude'],
              currentLocation['latitude'], currentLocation['longitude']) <
          User.getRayon()) {
        myController.addMarker(
          MarkerOptions(
            position: LatLng(client['latitude'], client['longitude']),
            draggable: false,
            icon:
                BitmapDescriptor.fromAsset("assets/MapElements/MarkerBus.png"),
            infoWindowText: InfoWindowText(
                client['nom'],
                'Distance:' +
                    distance(
                            client['latitude'],
                            client['longitude'],
                            currentLocation['latitude'],
                            currentLocation['longitude'])
                        .toInt()
                        .toString() +
                    ' m'),
          ),
        );
      }
    });
  }

  double degreesToRadians(degrees) {
    return degrees * 3.141592 / 180;
  }

  double distance(lat1, lon1, lat2, lon2) {
    var earthRadiusKm = 6371;

    var dLat = degreesToRadians(lat2 - lat1);
    var dLon = degreesToRadians(lon2 - lon1);

    lat1 = degreesToRadians(lat1);
    lat2 = degreesToRadians(lat2);

    var a = sin(dLat / 2) * sin(dLat / 2) +
        sin(dLon / 2) * sin(dLon / 2) * cos(lat1) * cos(lat2);
    var c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadiusKm * c * 1000;
  }
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    mess = "La ligne : DPGR -> BIBLIOTHEQUE " +
        " \n\nLa station: DPGR";
    // TODO: implement build
    return new Scaffold(
      key: key ,
      appBar: AppBar(
        backgroundColor: ThemeColors.WhiteGrey,
        elevation: 0,
        leading: IconButton(

          icon: Icon(
            FontAwesomeIcons.bars,
            color: Colors.black87,
            size: 30,
          ),
          onPressed: () {
            print('yessss');
            key.currentState.openDrawer();
          },
        ),
        title: Text(
          'BusTracker',
          style: TextStyle(
              color: Colors.black87, fontSize: 28, fontFamily: 'Montserrat'),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height - 80.0,
              width: double.infinity,
              child: mapToggle
                  ? GoogleMap(
                      options: GoogleMapOptions(
                        trackCameraPosition: false,
                        mapType: MapType.normal,
                        compassEnabled: false,
                        cameraPosition: CameraPosition(
                          target: LatLng(36.6993, 3.1755),
                          zoom: 14,
                        ),
                        myLocationEnabled: true,
                      ),
                      onMapCreated: onMapCreated,
                    )
                  : Center(
                      child: Text(
                        'Veuillez Patientez..',
                        style: TextStyle(color: Colors.black87, fontSize: 28),
                      ),
                    )),
          Container(
              child: completedd
                  ? AlertDialog(
                      title: new Text("Vous êtes actuellement dans"),
                      content: new Text("${mess}"),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    )
                  : Text('')),
          Container(
              height: 80,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    ThemeColors.WhiteGrey,
                    ThemeColors.TransparentWhiteGrey,
                  ]))),
          Padding(
            padding: const EdgeInsets.only(top: 6, left: 20, right: 20),
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                        color: ShadowColors.LightShadow,
                        blurRadius: 6,
                        offset: Offset(0, 4))
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
                        FontAwesomeIcons.mapMarkerAlt,
                        color: ThemeColors.mainRed,
                        size:
                            (MediaQuery.of(context).size.width - 40) * 0.1742 -
                                36,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Alger, Algérie",
                    style: TextStyle(
                        fontSize: 15,
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
                                blurRadius: 6,
                                offset: Offset(0, 4))
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          IconButton(
                              tooltip: 'Ajuster la caméra au nord',
                              icon: Icon(
                                FontAwesomeIcons.solidCompass,
                                color: Colors.black38,
                                size: (MediaQuery.of(context).size.width - 40) *
                                        0.1742 -
                                    36,
                              ),
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onPressed: () {
                                myController.animateCamera(
                                  CameraUpdate.newCameraPosition(
                                    CameraPosition(
                                      target: LatLng(36.6993, 3.1285),
                                      bearing: 0,
                                      zoom: 11,
                                    ),
                                  ),
                                );
                              }),
                          IconButton(
                              tooltip: 'Afficher les bus proches',
                              icon: Icon(
                                FontAwesomeIcons.bus,
                                color: Colors.black38,
                                size: (MediaQuery.of(context).size.width - 40) *
                                        0.1742 -
                                    36,
                              ),
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onPressed: () {}),
                          SizedBox(
                              width: (MediaQuery.of(context).size.width - 40) *
                                  0.1742),
                          IconButton(
                              tooltip: 'Montrer la ville entière',

                              icon: Icon(
                                FontAwesomeIcons.solidBuilding,
                                color: Colors.black38,
                                size: (MediaQuery.of(context).size.width - 40) *
                                        0.1742 -
                                    36,
                              ),
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onPressed: () {
                                myController.animateCamera(
                                    CameraUpdate.newCameraPosition(
                                        CameraPosition(
                                  target: LatLng(36.6993, 3.1285),
                                  zoom: 10,
                                )));
                              }),
                          IconButton(
                              tooltip: 'Changer le type de carte',
                              icon: Icon(
                                FontAwesomeIcons.layerGroup,
                                color: Colors.black38,
                                size: 20,
                              ),
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onPressed: () {
                                i++;
                                switch (i) {
                                  case 1:
                                    {
                                      myController.updateMapOptions(
                                          GoogleMapOptions(
                                              mapType: MapType.hybrid));
                                    }
                                    break;
                                  case 2:
                                    {
                                      myController.updateMapOptions(
                                          GoogleMapOptions(
                                              mapType: MapType.terrain));
                                    }
                                    break;
                                  case 3:
                                    {
                                      myController.updateMapOptions(
                                          GoogleMapOptions(
                                              mapType: MapType.normal));
                                      i = 0;
                                    }
                                    break;
                                }
                              }),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 7),
                      child: Container(
                          height: (MediaQuery.of(context).size.width - 40) *
                                  0.1742 -
                              14,
                          width: (MediaQuery.of(context).size.width - 40) *
                                  0.1742 -
                              14,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white, width: 2.5),
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
                            tooltip:
                                "Déplacer la caméra vers l'emplacement actuel",
                            child: Icon(FontAwesomeIcons.streetView, size: 20),
                            backgroundColor: Color(0x00FFFFFF),
                            elevation: 0,
                            onPressed: () {
                              myController.animateCamera(
                                CameraUpdate.newCameraPosition(
                                  CameraPosition(
                                    target: LatLng(currentLocation['latitude'],
                                        currentLocation['longitude']),
                                    zoom: 13.5,
                                  ),
                                ),
                              );
                            },
                          )),
                    )
                  ],
                )),
          ),
        ],
      ),

      /// here i implemented the drawer

      drawer: new Drawer(
          elevation: 0,
          child: Container(
            color: Color.fromARGB(255, 247, 247, 247),
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
                                  begin: Alignment.topLeft,
                                  end: Alignment.centerRight,
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
                                      blurRadius: 4)
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
                        SizedBox(
                          height: 12,
                        ),
                        Text(User.getPrenom() + " " + User.getNom(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
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
                                      padding: EdgeInsets.all(7),
                                      child: Icon(
                                        FontAwesomeIcons.link,
                                        color: ThemeColors.analogousOrange,
                                        size: 16,
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
                                    fontSize: 12,
                                    color: ThemeColors.analogousOrange,
                                    fontFamily: 'Montserrat',
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
                                      padding: EdgeInsets.all(7),
                                      child: Icon(
                                        FontAwesomeIcons.cog,
                                        color: ThemeColors.analogousMagenta,
                                        size: 16,
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Règlages Options',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: ThemeColors.analogousMagenta,
                                    fontFamily: 'Montserrat',
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
                              Icon(
                                FontAwesomeIcons.solidComments,
                                color: Colors.black54,
                                size: 16,
                              ),
                              SizedBox(width: 12),
                              Text(
                                "Aide et commentaires",
                                style: TextStyle(fontSize: 14),
                              ),
                              Expanded(child: SizedBox())
                            ],
                          ),
                          onPressed: _launchCommentairesURL,
                        ),
                        FlatButton(
                          highlightColor: ThemeColors.WhiteGrey,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          child: Row(
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.book,
                                color: Colors.black54,
                                size: 16,
                              ),
                              SizedBox(width: 12),
                              Text(
                                "Guide à l'usage",
                                style: TextStyle(fontSize: 14),
                              ),
                              Expanded(child: SizedBox())
                            ],
                          ),
                          onPressed: _launchGuideURL,
                        ),
                        FlatButton(
                          highlightColor: ThemeColors.WhiteGrey,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          child: Row(
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.users,
                                color: Colors.black54,
                                size: 16,
                              ),
                              SizedBox(width: 12),
                              Text(
                                'A propos de nous',
                                style: TextStyle(fontSize: 14),
                              ),
                              Expanded(child: SizedBox())
                            ],
                          ),
                          onPressed: _launchNousURL,
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
                      highlightColor: Color.fromARGB(255, 247, 247, 247),
                      splashColor: Colors.transparent,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.signOutAlt,
                            color: Colors.black54,
                            size: 16,
                          ),
                          SizedBox(width: 12),
                          Text(
                            'Déconnexion',
                            style: TextStyle(fontSize: 14),
                          ),
                          Expanded(child: SizedBox())
                        ],
                      ),
                      onPressed: () {
                        FirebaseAuth.instance.signOut().then((value) {
                          Navigator.of(context).pop();
                          Navigator.of(context).pushReplacementNamed('/LogIn');
                        }).catchError((e) {
                          print(e);
                        });
                      },
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

  _launchCommentairesURL() async {
    const url = 'https://github.com/Majidbouikken/Projet_2cp_G5';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchGuideURL() async {
    const url = 'https://github.com/Majidbouikken/Projet_2cp_G5';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchNousURL() async {
    const url = 'https://github.com/Majidbouikken/Projet_2cp_G5';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class gestion {
  static bool
      existe_arret; //Variable globale pour preciser si il existe un arret proche ou pas
  static String name_ligne = "vide"; //Variable globale pour nom de la ligne
  static String name_arret = "vide"; //Variable globale pour nom d'arret

  static double x_user = User.getLat(); //X de User
  static double y_user = User.getLong(); // Y de User
  static double rayon_arret =
      20; // le rayon de l'arret pour prendre cest User est dans l'arret ou pas (metre)

  Future<String> module() async {
    String mess;
    existe_arret = false;
    await Firestore.instance
        .collection("/lignes")
        .getDocuments()
        .then((data) async {
      int max = data.documents.length; //calcul le nombre des lignes maximal est nb_docs
      int i = 1;

      while ((i <= max) && (existe_arret == false)) {
        //parcour de tous les lignes

        await Firestore.instance.collection("/lignes").where("ligneID", isEqualTo: i).getDocuments()
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
    User.setExist(existe_arret);
    return mess;
  }

  double degreesToRadians(degrees) {
    return degrees * 3.14 / 180;
  }

  double distance(lat1, lon1, lat2, lon2) {
    var earthRadiusKm = 6371;

    var dLat = degreesToRadians(lat2 - lat1);
    var dLon = degreesToRadians(lon2 - lon1);

    lat1 = degreesToRadians(lat1);
    lat2 = degreesToRadians(lat2);

    var a = sin(dLat / 2) * sin(dLat / 2) +
        sin(dLon / 2) * sin(dLon / 2) * cos(lat1) * cos(lat2);
    var c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadiusKm * c * 1000;
  }
}
