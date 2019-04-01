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
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 2,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black87,
            size: 25,
          ),
          onPressed: () {
            Navigator.of(context)
                .pushNamed("/HomePage");
          },
        ),
        title: Text(
          "Lignes disponibles",
          style: Theme.of(context).textTheme.title,
        ),
      ),
        body: LigneList()
    );
  }
}

List<LigneCard> ligneCards = [
  LigneCard(
      'Ligne1', 'Ban Aknoun', 'Cheraga', '13.7km', 'assets/images/ligne.png'),
  LigneCard(
      'Ligne2', 'Cheraga', 'Ban Aknoun', '13.7km', 'assets/images/ligne.png'),
  LigneCard(
      'Ligne3', 'Babezzouar', 'Canastel', '397.2km', 'assets/images/ligne.png'),
  LigneCard(
      'Ligne4', 'Canastel', 'Babezzouar', '397.2km', 'assets/images/ligne.png'),
  LigneCard('Ligne5', 'Tafourah', 'Sidi Abdallah', '16.9km',
      'assets/images/ligne.png'),
  LigneCard('Ligne6', 'Sidi Abdallah', 'Tafourah', '16.9km',
      'assets/images/ligne.png'),
];


// TODO: fetch a JSON file and convert it to this class, or vice versa
class LigneCard extends StatelessWidget {
  final String Nom, Depart, Terminus, Longueur, ImagePath;

  const LigneCard(
      this.Nom, this.Depart, this.Terminus, this.Longueur, this.ImagePath);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 4),
      child: Container(
        height: 138,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: [
              //TODO: add this shadow color to the main as color variable
              new BoxShadow(color: Color.fromARGB(10, 0, 0, 0), blurRadius: 10),
              new BoxShadow(
                  color: Color.fromARGB(33, 0, 0, 0),
                  offset: Offset(0, 10),
                  blurRadius: 10),
            ]),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  child: Image.asset(
                    this.ImagePath,
                    fit: BoxFit.fitHeight,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        this.Nom,
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      ),
                      Expanded(child: SizedBox()),
                      Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                  color: Color.fromARGB(120, 0, 0, 0),
                                )
                              ]),
                          child: Text(
                            this.Longueur,
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          )),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(height: 20),
                      Text('  ' + this.Depart),
                      Text('  ' + this.Terminus)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class LigneList extends StatefulWidget {
  @override
  _LigneListState createState() => _LigneListState();
}

class _LigneListState extends State<LigneList> {

  Future getLines() async {
    var firestore = Firestore.instance;

    QuerySnapshot qn = await firestore.collection("lignes").getDocuments();
    return qn.documents;
  }
  
  navigateToDetail(DocumentSnapshot post){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> StationList(post: post,)));
  }
  
  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder(
          future: getLines(),
            builder: (_,snapshot){
              if(snapshot.data==null)
                {
                  return CircularProgressIndicator();
                }
                else {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (_,index){
                      return ListTile(
                        title: Text(snapshot.data[index].data["direction"]),
                        subtitle: Text('Nombre d arrets : ' +snapshot.data[index].data["nb_arrets"].toString()),
                        onTap: () => navigateToDetail(snapshot.data[index]),
                      );
                  });
              }
            }),
    );
  }
}

class StationList extends StatefulWidget {

  final DocumentSnapshot post;

  StationList({this.post});


  @override
  _StationListState createState() => _StationListState();
}

class _StationListState extends State<StationList> {

  Future getStations(DocumentSnapshot post) async {
    var firestore = Firestore.instance;

    QuerySnapshot qn = await firestore.collection("/lignes/" + post.documentID +  "/arrets de bus").getDocuments();

    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 2,
        title: Text(widget.post.data["direction"],
          style: TextStyle(fontSize: 22,color: Colors.black),
      ),
      ),
    body: Center(
      child: FutureBuilder(
          future:  getStations(widget.post),
          builder: (_,snapshot){
            if(snapshot.data==null)
            {
              return CircularProgressIndicator();
            }
            else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_,index){
                    return ListTile(
                      title: Text(snapshot.data[index].data["nom"]),
                      subtitle: Text('ID : ' +snapshot.data[index].data["arretID"].toString()),
                    );
                  });
            }
          }),
    )
    );
  }
}
