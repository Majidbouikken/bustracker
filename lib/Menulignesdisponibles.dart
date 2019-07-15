import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MesLignes extends StatefulWidget {
  @override
  _MesLignesState createState() => _MesLignesState();
}

class _MesLignesState extends State<MesLignes> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(body: LigneList());
  }
}

class LigneList extends StatefulWidget {
  @override
  _LigneListState createState() => _LigneListState();
}

class _LigneListState extends State<LigneList> {
  List<Widget> LineList = new List<Widget>();

  Future getLines() async {
    var firestore = Firestore.instance;

    QuerySnapshot qn = await firestore.collection("lignes").getDocuments();
    return qn.documents;
  }

  navigateToDetail(DocumentSnapshot post) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => StationList(
                  post: post,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          backgroundColor: Color(0xFFFAFAFA),
          expandedHeight: 80,
          elevation: 2,
          leading: IconButton(
            icon: Icon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.black87,
              size: 24,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/HomePage');
            },
          ),
          title: Text(
            "Lignes disponibles",
            style: Theme.of(context).textTheme.title,
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: FutureBuilder(
                future: getLines(),
                builder: (_, snapshot) {
                  if (snapshot.data == null) {
                    return Column(
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                        ),
                        CircularProgressIndicator()
                      ],
                    );
                  } else {
                    for (var i = 0; i < snapshot.data.length; i++) {
                      LineList.add(LineCard(i, snapshot));
                    }
                    return Column(
                      children: LineList,
                    );
                  }
                }),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.33)
        ]))
      ],
    ));
  }

  Widget LineCard(int i, var snapshot) {
    return new InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => navigateToDetail(snapshot.data[i]),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 4),
        child: Container(
          height: 126,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(25)),
              boxShadow: [
                new BoxShadow(
                    color: ShadowColors.VeryLightShadow, blurRadius: 10),
                new BoxShadow(
                    color: ShadowColors.MediumShadow,
                    offset: Offset(0, 10),
                    blurRadius: 10),
              ]),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    child: Opacity(
                      opacity: 0.5,
                      alwaysIncludeSemantics: true,
                      child: Image.asset(
                        "assets/images/ligne.png",
                        fit: BoxFit.fitHeight,
                      ),
                    )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width : MediaQuery.of(context).size.width/1.8,
                          child: Text(
                            snapshot.data[i].data["direction"],
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ThemeColors.mainRed,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                    color: ShadowColors.MediumShadow,
                                  )
                                ]),
                            child: Text(
                              snapshot.data[i].data["nb_arrets"].toString() +
                                  ' arrêts',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*ListView.builder(
  itemCount: snapshot.data.length,
  itemBuilder: (_,index){
    return ListTile(
      title: Text(snapshot.data[index].data["direction"]),
      subtitle: Text('Nombre d arrets : ' +snapshot.data[index].data["nb_arrets"].toString()),
      trailing: Icon(Icons.keyboard_arrow_right),

    );
  });*/

class StationList extends StatefulWidget {
  final DocumentSnapshot post; //document de la ligne choisis

  StationList({this.post});

  @override
  _StationListState createState() => _StationListState();
}

class _StationListState extends State<StationList> {
  Future getStations(DocumentSnapshot post) async {
    var firestore = Firestore.instance;

    QuerySnapshot qn = await firestore
        .collection("/lignes/" + post.documentID + "/arrets de bus")
        .getDocuments();
    print(qn.documents.length);

    return qn.documents;
  }

  navigateToDetail(DocumentSnapshot arrets, DocumentSnapshot ligne) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BusList(arret: arrets, ligne: ligne)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          leading: GestureDetector(
            onTap: (){Navigator.of(context).pop();},
            child: Icon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.black87,
              size: 24,
            ),
          ),
          backgroundColor: Color(0xFFFAFAFA),
          elevation: 2,
          title: Text(
            widget.post.data["direction"],
            style: TextStyle(fontSize: 22, color: Colors.black),
          ),
        ),
        body: Center(
          child: FutureBuilder(
              future: getStations(widget.post),
              builder: (_, snapshot) {
                if (snapshot.data == null) {
                  return CircularProgressIndicator();
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (_, index) {
                        return ListTile(
                          title: Text(snapshot.data[index].data["nom"]),
                          subtitle: Text('ID : ' +
                              snapshot.data[index].data["arretID"].toString()),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () => navigateToDetail(
                              snapshot.data[index], widget.post),
                        );
                      });
                }
              }),
        ));
  }
}

class BusList extends StatefulWidget {
  final DocumentSnapshot ligne;

  final DocumentSnapshot arret;

  BusList({this.arret, this.ligne});

  @override
  _BusListState createState() => _BusListState();
}

class _BusListState extends State<BusList> {
  Future getBus(DocumentSnapshot arret, DocumentSnapshot ligne) async {
    var firestore = Firestore.instance;
    print(
        'ligne ID : ${widget.ligne.data['ligneID']}     ........   ${widget.arret.data['arretID']} ');
    QuerySnapshot qn = await firestore
        .collection('bus')
        .where('actif', isEqualTo: true)
        .where('ligne', isEqualTo: widget.ligne.data['ligneID'])
        .where('prochain', isLessThanOrEqualTo: widget.arret.data['arretID'])
        .getDocuments();
    print(qn.documents.length);
    return qn;
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

  List<Map<String, dynamic>> calcul_temps_estime(
      List<DocumentSnapshot> listbus) {
    var bus = List<Map<String, dynamic>>(listbus.length);
    for (var i = 0; i < listbus.length; i++) {
      var im = new Map().cast<String, dynamic>();
      im['id'] = listbus[i].data['busID'];

      var dis = distance(
          listbus[i].data['latitude'],
          listbus[i].data['longitude'],
          widget.arret.data['latitude'],
          widget.arret.data['longitude']);

      if (listbus[i].data['vitesse'] == 0) {
        im['temps'] = ' embouteillage';
      } else {
        var temps = dis /
            (listbus[i].data['vitesse'] *
                0.277777777777777777777777777777777777777777778);
        im['seconde'] = (temps % 60).floor();
        im['minute'] = (temps / 60).floor();
        im['heure'] = (temps / 3600).floor();
        im['temps'] = im['heure'].toString() +
            'h ' +
            im['minute'].toString() +
            'min ' +
            im['seconde'].toString() +
            's';
      }
      bus[i] = im;
    }
    return bus;
  }

  @override
  Widget build(BuildContext context) {
    var res;
    print('herere');
    return FutureBuilder(
        future: getBus(widget.arret, widget.ligne),
        builder: (_, bus) {
          if (bus.data == null) {
            print('daaaaaaaaaaaaaaaakheeeeeeeeeeeeeeeeeeeeellllll');
            return Scaffold(
              appBar: new AppBar(
                leading: Icon(
                  FontAwesomeIcons.arrowLeft,
                  color: Colors.black87,
                  size: 24,
                ),
                backgroundColor: Color(0xFFFAFAFA),
                elevation: 2,
                title: Text(
                  '${widget.ligne.data['direction']}',
                  style: TextStyle(fontSize: 22, color: Colors.black),
                ),
              ),
              body: Center(child: CircularProgressIndicator()),
            );
          } else {
            print(bus.data.documents.length.toString());

            if (bus.data.documents.length != 0) {
              res = calcul_temps_estime(bus.data.documents);
              return Scaffold(
                appBar: new AppBar(
                  leading: GestureDetector(
                    onTap: (){Navigator.of(context).pop();},
                    child: Icon(
                      FontAwesomeIcons.arrowLeft,
                      color: Colors.black87,
                      size: 24,
                    ),
                  ),
                  backgroundColor: Color(0xFFFAFAFA),
                  elevation: 2,
                  title: Text(
                    '${widget.ligne.data['direction']}',
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                ),
                body: RefreshIndicator(
                  onRefresh: () async {
//                    Navigator.of(context).pop();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BusList(arret: widget.arret, ligne: widget.ligne)));
                    return;
                  },
                  child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 00.0),
                      itemCount: res.length,
                      itemBuilder: (_, index) {
                        return ListTile(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                          title: Text('BUS ' + res[index]['id'].toString()),
                          subtitle:
                              Text('Direction : ' + widget.ligne.data['direction']),
                          leading: Icon(Icons.directions_bus),
                          trailing: Text(res[index]['temps'].toString()),
                        );
                      }),
                ),
              );
            } else {
              return Scaffold(
                body: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              ThemeColors.gradientOrange,
                              ThemeColors.gradientRed,
                              ThemeColors.gradientMagenta,
                        ])),
                    child: Stack(
                      children: <Widget>[
                        AppBar(
                          leading: GestureDetector(
                            onTap: (){Navigator.of(context).pop();},
                            child: Icon(
                              FontAwesomeIcons.arrowLeft,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          title: Text(
                            '${widget.ligne.data['direction']}',
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                            Image.asset('assets/images/errorNoBusComing.png', width: 150,),
                            Text('''No bus is coming''', style: TextStyle(fontFamily: 'Montserrat', fontSize: 20, color: Colors.white),)
                          ],),
                        ),
                      ],
                    )),
              );
            }
          }
        });
  }
}
