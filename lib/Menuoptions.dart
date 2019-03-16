import 'package:flutter/material.dart';
import 'package:projet_2cp_g5/main.dart';

/* these variables are used to save onchange text fields values, if the confirm button is pressed,
     the true values of the settings will be affected by these guys, otherwise they'll be lost */

// TODO: Replace the setters and getters with a common template
String TempAdresseMail = "";
String TempNumTel = "";
String TempNom = "";
String TempPrenom = "";

class MenuOptions extends StatefulWidget {
  @override
  State createState() => new MenuOptionsState();
}

// TODO: add descriptions and texts as variables

class MenuOptionsState extends State<MenuOptions> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            backgroundColor: Color(0xFFFAFAFA),
            expandedHeight: 80,
            elevation: 2,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black87,
                size: 36,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/login');
              },
            ),
            title: Text(
              "Réglages",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 24),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text("Ville actuelle",
                                  style: Theme.of(context).textTheme.subhead),
                              Expanded(child: SizedBox()),
                              Text(
                                VilleActuelle,
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                /// here i implemented the Rayon settings components

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 24),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text("Rayon de recherche",
                                  style: Theme.of(context).textTheme.subhead),
                              Expanded(child: SizedBox()),
                              Text(
                                '${ValeurRayon.toInt()}m',
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                          SizedBox(height: 8),
                          Slider(
                            min: 100,
                            max: 1000,
                            inactiveColor: lightGrey,
                            onChanged: (newRating) {
                              setState(() => ValeurRayon = newRating);
                            },
                            value: ValeurRayon,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                  child: Text(
                      'Modifier le rayon de la recherche pour lorum ipsum cardi le dinspiration réglages du profil',
                      style: Theme.of(context).textTheme.body2),
                ),

                /// here i implemented the Profile settings components

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Text(
                    "Réglages du profil",
                    style: Theme.of(context).textTheme.headline,
                  ),
                ),

                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Card(
                      elevation: 2,
                      margin: EdgeInsets.all(0),
                      child: FlatButton(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 8),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "Adresse mail",
                                  style: TextStyle(color: Colors.black),
                                ),
                                Expanded(child: SizedBox()),
                                Text(User.getAdresseMail(),
                                    style: Theme.of(context).textTheme.body1),
                              ],
                            ),
                          ),
                          onPressed: () {
                            AlertDialog Dialog = new AlertDialog(
                              title: Text(
                                "Changer votre adresse mail",
                                style: Theme.of(context).textTheme.subhead,
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  // this text field is for the Numero de telephone
                                  TextField(
                                    onChanged: (String value) {
                                      User.setAdresseMail(value);
                                    },
                                    autofocus: true,
                                    style: Theme.of(context).textTheme.display1,
                                    decoration: InputDecoration(
                                      hintText: User.getAdresseMail(),
                                      hintStyle:
                                          Theme.of(context).textTheme.display2,
                                    ),
                                  ),
                                ],
                              ),
                              actions: <Widget>[
                                RaisedButton(
                                  color: Colors.white,
                                  shape: Border.all(color: mainRed, width: 2),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    child: Text("Annuler",
                                        style: TextStyle(color: mainRed)),
                                  ),
                                  onPressed: () {},
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: RaisedButton(
                                    color: mainRed,
                                    child: Text(
                                      "Confirmer",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            );
                            showDialog(context: context, child: Dialog);
                          }),
                    )),
                SizedBox(
                  height: 8,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Card(
                      elevation: 2,
                      margin: EdgeInsets.all(0),
                      child: FlatButton(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 8),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "Numéro de téléphone",
                                  style: TextStyle(color: Colors.black),
                                ),
                                Expanded(child: SizedBox()),
                                Text(User.getNumTel(),
                                    style: Theme.of(context).textTheme.body1),
                              ],
                            ),
                          ),
                          onPressed: () {
                            AlertDialog Dialog = new AlertDialog(
                              title: Text(
                                "Changer votre numero de téléphone",
                                style: Theme.of(context).textTheme.subhead,
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  // this text field is for the Numero de telephone
                                  TextField(
                                    onChanged: (String value) {
                                      User.setNumTel(value);
                                    },
                                    autofocus: true,
                                    style: Theme.of(context).textTheme.display1,
                                    decoration: InputDecoration(
                                      hintText: User.getNumTel(),
                                      hintStyle:
                                          Theme.of(context).textTheme.display2,
                                    ),
                                  ),
                                ],
                              ),
                              actions: <Widget>[
                                RaisedButton(
                                  color: Colors.white,
                                  shape: Border.all(color: mainRed, width: 2),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    child: Text("Annuler",
                                        style: TextStyle(color: mainRed)),
                                  ),
                                  onPressed: () {},
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: RaisedButton(
                                    color: mainRed,
                                    child: Text(
                                      "Confirmer",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            );
                            showDialog(context: context, child: Dialog);
                          }),
                    )),

                Padding(
                  padding: const EdgeInsets.only(
                      left: 32, right: 32, top: 8, bottom: 16),
                  child: Text(
                      'Vérifier le numéro de téléphone pour aider à sécuriser votre compte',
                      style: Theme.of(context).textTheme.body2),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Card(
                      elevation: 2,
                      margin: EdgeInsets.all(0),
                      child: FlatButton(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 8),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "Modifier le nom et le prénom",
                                  style: TextStyle(color: Colors.black),
                                ),
                                Expanded(child: SizedBox()),
                              ],
                            ),
                          ),
                          onPressed: () {
                            AlertDialog Dialog = new AlertDialog(
                              title: Text(
                                "Modifier le nom et le prénom",
                                style: Theme.of(context).textTheme.subhead,
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  // this text field is for the Prenom
                                  TextField(
                                    onChanged: (String value) {
                                      User.setPrenom(value);
                                    },
                                    style: Theme.of(context).textTheme.display1,
                                    decoration: InputDecoration(
                                      hintText: User.getPrenom(),
                                      hintStyle:
                                      Theme.of(context).textTheme.display2,
                                    ),
                                  ),

                                  // this text field is for the Nom
                                  TextField(
                                    onChanged: (String value) {
                                      User.setNom(value);
                                    },
                                    style: Theme.of(context).textTheme.display1,
                                    decoration: InputDecoration(
                                      hintText: User.getNom(),
                                      hintStyle:
                                      Theme.of(context).textTheme.display2,
                                    ),
                                  ),
                                  SizedBox(height: 12,),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: RaisedButton(
                                          color: Colors.white,
                                          shape: Border.all(
                                              color: mainRed, width: 2),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12),
                                            child: Text("Annuler",
                                                style: TextStyle(color: mainRed)),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                      SizedBox(width: 12,),
                                      Expanded(
                                        child: RaisedButton(
                                          color: mainRed,
                                          child: Text(
                                            "Confirmer",
                                            style:
                                            TextStyle(color: Colors.white),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            );
                            showDialog(context: context, child: Dialog);
                          }),
                    )),
                SizedBox(
                  height: 8,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Card(
                      elevation: 2,
                      margin: EdgeInsets.all(0),
                      child: FlatButton(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 8),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "Modifier le mot de passe",
                                  style: TextStyle(color: Colors.black),
                                ),
                                Expanded(child: SizedBox()),
                              ],
                            ),
                          ),
                          onPressed: main),
                    )),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 32, right: 32, top: 8, bottom: 16),
                  child: Text('Modifier le mot de passe',
                      style: Theme.of(context).textTheme.body2),
                ),

                /// here i implemented le comment utiliser le sms?

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "Comment utiliser le SMS?",
                    style: Theme.of(context).textTheme.headline,
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                  child: Text(
                      'Voici une petite vidéo démonstrative, lorem ipsum der ricardo kaka el dorado mafia\nEt pour chaque homme une pomme\ndonc merci',
                      style: Theme.of(context).textTheme.body2),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: RaisedButton(
                    color: Colors.white,
                    splashColor: highlightedBlue,
                    highlightColor: Colors.transparent,
                    elevation: 2,
                    highlightElevation: 1,
                    child: Container(
                      margin: EdgeInsets.only(top: 12, bottom: 16),
                      child: Column(
                        children: <Widget>[
                          Material(
                              color: Colors.white,
                              elevation: 4,
                              shadowColor: Color.fromARGB(130, 0, 0, 0),
                              borderRadius: BorderRadius.circular(100),
                              child: Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Icon(
                                    Icons.play_arrow,
                                    color: complementaryBlue,
                                    size: 22,
                                  ))),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Montrer une vidéo',
                            style:
                                TextStyle(fontSize: 11, color: complementaryBlue),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
                      SimpleDialog dialog = new SimpleDialog(children: <Widget>[Text("Tutorial")],);
                      showDialog(context: context, child: dialog);
                    },
                  ),
                ),

                SizedBox(
                  height: 80,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
