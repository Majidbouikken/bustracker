import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:projet_2cp_g5/main.dart';
import 'package:projet_2cp_g5/MyWidgets.dart';

/* these variables are used to save onchange text fields values, if the confirm button is pressed,
     the true values of the settings will be affected by these guys, otherwise they'll be lost */

// TODO: make the CONFIRMER ET ANNULER buttons work!

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
            backgroundColor: ThemeColors.WhiteGrey,
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
                            min: 400,
                            max: 1000,
                            inactiveColor: ThemeColors.lightGrey,
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
                      '''Modifier le rayon de la recherche pour lorum ipsum cardi le dinspiration réglages du profil''',
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
                            MyDialog dialog = new MyDialog(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12.0),
                                    child: Text(
                                      "Changez l'adresse mail",
                                      style:
                                      Theme.of(context).textTheme.display1,
                                    ),
                                  ),

                                  // this text field is for the NumTel
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: CupertinoTextField(
                                      decoration: BoxDecoration(
                                          color: ThemeColors.lightGrey),
                                      onChanged: (String value) {
                                        User.setAdresseMail(value);
                                      },
                                      style:
                                      Theme.of(context).textTheme.display1,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            width: 1080,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: ThemeColors.mainRed,
                                                  width: 2),
                                              borderRadius:
                                              BorderRadius.circular(100),
                                              color: Colors.white,
                                            ),
                                            child: FlatButton(
                                                materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                                onPressed: main,
                                                child: Text(
                                                  "ANNULER",
                                                  style: new TextStyle(
                                                      color:
                                                      ThemeColors.mainRed,
                                                      fontFamily: 'Oxygen',
                                                      fontSize: 12),
                                                )),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: 1080,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(100),
                                              gradient: LinearGradient(
                                                colors: [
                                                  ThemeColors.gradientOrange,
                                                  ThemeColors.gradientRed,
                                                  ThemeColors.gradientMagenta,
                                                ],
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                    color:
                                                    ShadowColors.RedShadow,
                                                    offset: Offset(0, 3),
                                                    blurRadius: 10)
                                              ],
                                            ),
                                            child: FlatButton(
                                                materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                                onPressed: main,
                                                child: Text(
                                                  "CONFIRMER",
                                                  style: new TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Oxygen',
                                                      fontSize: 12),
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                            showDialog(context: context, child: dialog);
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
                            MyDialog dialog = new MyDialog(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12.0),
                                    child: Text(
                                      "Changez le numéro du téléphone",
                                      style:
                                      Theme.of(context).textTheme.display1,
                                    ),
                                  ),

                                  // this text field is for the NumTel
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: CupertinoTextField(
                                      decoration: BoxDecoration(
                                          color: ThemeColors.lightGrey),
                                      onChanged: (String value) {
                                        User.setNumTel(value);
                                      },
                                      style:
                                      Theme.of(context).textTheme.display1,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            width: 1080,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: ThemeColors.mainRed,
                                                  width: 2),
                                              borderRadius:
                                              BorderRadius.circular(100),
                                              color: Colors.white,
                                            ),
                                            child: FlatButton(
                                                materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                                onPressed: main,
                                                child: Text(
                                                  "ANNULER",
                                                  style: new TextStyle(
                                                      color:
                                                      ThemeColors.mainRed,
                                                      fontFamily: 'Oxygen',
                                                      fontSize: 12),
                                                )),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: 1080,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(100),
                                              gradient: LinearGradient(
                                                colors: [
                                                  ThemeColors.gradientOrange,
                                                  ThemeColors.gradientRed,
                                                  ThemeColors.gradientMagenta,
                                                ],
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                    color:
                                                    ShadowColors.RedShadow,
                                                    offset: Offset(0, 3),
                                                    blurRadius: 10)
                                              ],
                                            ),
                                            child: FlatButton(
                                                materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                                onPressed: main,
                                                child: Text(
                                                  "CONFIRMER",
                                                  style: new TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Oxygen',
                                                      fontSize: 12),
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                            showDialog(context: context, child: dialog);
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
                            MyDialog dialog = new MyDialog(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12.0),
                                    child: Text(
                                      "Modifier le nom et le prénom",
                                      style:
                                      Theme.of(context).textTheme.display1,
                                    ),
                                  ),
                                  // this text field is for new Password
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: CupertinoTextField(
                                      decoration: BoxDecoration(
                                          color: ThemeColors.lightGrey),
                                      onChanged: (String value) {
                                        User.setNom(value);
                                      },
                                      style:
                                      Theme.of(context).textTheme.display1,
                                    ),
                                  ),

                                  SizedBox(height: 8),

                                  // this text field is for confirming the new password
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: CupertinoTextField(
                                      decoration: BoxDecoration(
                                          color: ThemeColors.lightGrey),
                                      onChanged: (String value) {
                                        User.setPrenom(value);
                                      },
                                      style:
                                      Theme.of(context).textTheme.display1,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            width: 1080,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: ThemeColors.mainRed,
                                                  width: 2),
                                              borderRadius:
                                              BorderRadius.circular(100),
                                              color: Colors.white,
                                            ),
                                            child: FlatButton(
                                                materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                                onPressed: main,
                                                child: Text(
                                                  "ANNULER",
                                                  style: new TextStyle(
                                                      color:
                                                      ThemeColors.mainRed,
                                                      fontFamily: 'Oxygen',
                                                      fontSize: 12),
                                                )),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: 1080,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(100),
                                              gradient: LinearGradient(
                                                colors: [
                                                  ThemeColors.gradientOrange,
                                                  ThemeColors.gradientRed,
                                                  ThemeColors.gradientMagenta,
                                                ],
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                    color:
                                                    ShadowColors.RedShadow,
                                                    offset: Offset(0, 3),
                                                    blurRadius: 10)
                                              ],
                                            ),
                                            child: FlatButton(
                                                materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                                onPressed: main,
                                                child: Text(
                                                  "CONFIRMER",
                                                  style: new TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Oxygen',
                                                      fontSize: 12),
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                            showDialog(context: context, child: dialog);
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
                          onPressed: () {
                            MyDialog dialog = new MyDialog(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12.0),
                                    child: Text(
                                      "Nouveau mot de passe",
                                      style:
                                      Theme.of(context).textTheme.display1,
                                    ),
                                  ),
                                  // this text field is for new Password
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: CupertinoTextField(
                                      decoration: BoxDecoration(
                                          color: ThemeColors.lightGrey),
                                      onChanged: (String value) {},
                                      style:
                                      Theme.of(context).textTheme.display1,
                                    ),
                                  ),

                                  SizedBox(height: 6),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      children: <Widget>[
                                        Text("Confirmez le mot de passe",
                                            style: Theme.of(context)
                                                .textTheme
                                                .body1),
                                        Expanded(
                                          child: SizedBox(),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 6),

                                  // this text field is for confirming the new password
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: CupertinoTextField(
                                      decoration: BoxDecoration(
                                          color: ThemeColors.lightGrey),
                                      onChanged: (String value) {},
                                      style:
                                      Theme.of(context).textTheme.display1,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            width: 1080,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: ThemeColors.mainRed,
                                                  width: 2),
                                              borderRadius:
                                              BorderRadius.circular(100),
                                              color: Colors.white,
                                            ),
                                            child: FlatButton(
                                                materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                                onPressed: main,
                                                child: Text(
                                                  "ANNULER",
                                                  style: new TextStyle(
                                                      color:
                                                      ThemeColors.mainRed,
                                                      fontFamily: 'Oxygen',
                                                      fontSize: 12),
                                                )),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: 1080,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(100),
                                              gradient: LinearGradient(
                                                colors: [
                                                  ThemeColors.gradientOrange,
                                                  ThemeColors.gradientRed,
                                                  ThemeColors.gradientMagenta,
                                                ],
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                    color:
                                                    ShadowColors.RedShadow,
                                                    offset: Offset(0, 3),
                                                    blurRadius: 10)
                                              ],
                                            ),
                                            child: FlatButton(
                                                materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                                onPressed: main,
                                                child: Text(
                                                  "CONFIRMER",
                                                  style: new TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Oxygen',
                                                      fontSize: 12),
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                            showDialog(context: context, child: dialog);
                          }),
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
                      '''Voici une petite vidéo démonstrative, lorem ipsum der ricardo kaka el dorado mafia et pour chaque homme une pomme donc merci''',
                      style: Theme.of(context).textTheme.body2),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: RaisedButton(
                    color: Colors.white,
                    splashColor: ThemeColors.highlightedBlue,
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
                                  padding: EdgeInsets.only(top: 8, bottom: 8, right: 6, left: 10),
                                  child: Icon(
                                    FontAwesomeIcons.play,
                                    color: ThemeColors.complementaryBlue,
                                    size: 14,
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Montrer une vidéo',
                            style: TextStyle(
                                fontSize: 12,
                                color: ThemeColors.complementaryBlue,
                                fontFamily: 'Oxygen',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
                      MyDialog dialog = new MyDialog(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 12.0),
                              child: Text(
                                "Comment utiliser le SMS?",
                                style: Theme.of(context).textTheme.display1,
                              ),
                            ),

                            // TODO: implement the animations in sliders

                            Container(height:380,
                                child: PageView(children: HowSMS,)),

                            SizedBox(height: 24),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 140,
                                height: 40,
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
                                        offset: Offset(0, 3),
                                        blurRadius: 10)
                                  ],
                                ),
                                child: FlatButton(
                                    materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                    onPressed: main,
                                    child: Text(
                                      "SUIVANT",
                                      style: new TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Oxygen',
                                          fontSize: 12),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      );
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


List<MySlides> HowSMS = [
  MySlides('''Choisissez une station''', "assets/animations/tutoSMS1.flr"),
  MySlides('''Choisissez une station''', "assets/animations/tutoSMS1.flr"),
  MySlides('''Choisissez une station''', "assets/animations/tutoSMS1.flr"),

];
