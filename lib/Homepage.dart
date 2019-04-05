import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projet_2cp_g5/main.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  GoogleMapController myController;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.WhiteGrey,
        elevation: 0,
        leading: Icon(
          FontAwesomeIcons.bars,
          color: Colors.black87,
          size: 28,
        ),
        title: Text(
          "bustracker",
          style: TextStyle(color: Colors.black87, fontSize: 28),
        ),
      ),
      body: Stack(
        children: <Widget>[
          // TODO: here the Google maps should be implemented
          _googleMap(context),

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
                        FontAwesomeIcons.mapMarkerAlt,
                        color: ThemeColors.mainRed,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Oran, Algérie",
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
                                blurRadius: 8,
                                offset: Offset(0, 6))
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          IconButton(
                              icon: Icon(
                                FontAwesomeIcons.solidHeart,
                                color: Colors.black38,
                                size: 20,
                              ),
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onPressed: () {}),
                          IconButton(
                              icon: Icon(
                                FontAwesomeIcons.bus,
                                color: Colors.black38,
                                size: 20,
                              ),
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onPressed: () {}),
                          SizedBox(width: 46),
                          IconButton(
                              icon: Icon(
                                FontAwesomeIcons.locationArrow,
                                color: Colors.black38,
                                size: 20,
                              ),
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onPressed: () {}),
                          IconButton(
                              icon: Icon(
                                FontAwesomeIcons.layerGroup,
                                color: Colors.black38,
                                size: 20,
                              ),
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onPressed: () {
                                myController.animateCamera(
                                  CameraUpdate.newCameraPosition(
                                    CameraPosition(target: LatLng(35.696223, -0.647417), zoom: 14),
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 7),
                      child: Container(
                          height: 43,
                          width: 43,
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
                            child: Icon(FontAwesomeIcons.streetView, size: 20),
                            backgroundColor: Color(0x00FFFFFF),
                            elevation: 0,
                            onPressed: () {
                              myController.animateCamera(
                                CameraUpdate.newCameraPosition(
                                  CameraPosition(
                                      target: LatLng(35.796023, -0.652017),
                                      zoom: 9.5,
                                      bearing: -30),
                                ),
                              );
                            },
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
                        SizedBox(
                          height: 12,
                        ),
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
                                      padding: EdgeInsets.all(6),
                                      child: Icon(
                                        FontAwesomeIcons.link,
                                        color: ThemeColors.analogousOrange,
                                        size: 18,
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
                                      padding: EdgeInsets.all(6),
                                      child: Icon(
                                        FontAwesomeIcons.cog,
                                        color: ThemeColors.analogousMagenta,
                                        size: 18,
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
                            FontAwesomeIcons.signOutAlt,
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

  Widget _googleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
            CameraPosition(target: LatLng(35.696223, -0.647417), zoom: 14),
        onMapCreated: onMapCreated,
        myLocationEnabled: true,
        markers: {
          Marker(
              markerId: MarkerId('MyPosition'),
              icon: BitmapDescriptor.fromAsset(
                  "assets/MapElements/MarkerBus.png"),
              position: LatLng(35.696023, -0.652017)),
          Marker(
              markerId: MarkerId('YourPosition'),
              icon: BitmapDescriptor.fromAsset(
                  "assets/MapElements/MarkerBus.png"),
              position: LatLng(35.706223, -0.647417)),
          Marker(
              markerId: MarkerId('Tu'),
              icon: BitmapDescriptor.fromAsset(
                  "assets/MapElements/MarkerBus.png"),
              position: LatLng(35.699523, -0.641417)),
        },
      ),
    );
  }

  void onMapCreated(controller) {
    setState(() {
      myController = controller;
    });
  }
}
