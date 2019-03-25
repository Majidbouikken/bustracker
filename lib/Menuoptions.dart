import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui' show ImageFilter;
import 'main.dart';

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
                Navigator.of(context).pushNamed('/HomePage');
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
                                      decoration:
                                          BoxDecoration(color: lightGrey),
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
                                                  color: mainRed, width: 2),
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
                                                      color: mainRed,
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
                                                    color: Color(0xCCf95149),
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
                                      decoration:
                                          BoxDecoration(color: lightGrey),
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
                                                  color: mainRed, width: 2),
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
                                                      color: mainRed,
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
                                                    color: Color(0xCCf95149),
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
                                      decoration:
                                          BoxDecoration(color: lightGrey),
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
                                      decoration:
                                          BoxDecoration(color: lightGrey),
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
                                                  color: mainRed, width: 2),
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
                                                      color: mainRed,
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
                                                    color: Color(0xCCf95149),
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
                                      decoration:
                                          BoxDecoration(color: lightGrey),
                                      onChanged: (String value) {},
                                      style:
                                          Theme.of(context).textTheme.display1,
                                    ),
                                  ),

                                  SizedBox(height: 6),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      children: <Widget>[
                                        Text("Confirmez le mot de passe",
                                            style: Theme.of(context)
                                                .textTheme
                                                .body1),
                                        Expanded(child: SizedBox(),)
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 6),

                                  // this text field is for confirming the new password
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: CupertinoTextField(
                                      decoration:
                                          BoxDecoration(color: lightGrey),
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
                                                  color: mainRed, width: 2),
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
                                                      color: mainRed,
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
                                                    color: Color(0xCCf95149),
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
                            style: TextStyle(
                                fontSize: 11, color: complementaryBlue),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
                      SimpleDialog dialog = new SimpleDialog(
                        children: <Widget>[Text("Tutorial")],
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

/// This is the MyDialog class that i created to show a custom dialog, it is inspired from the CuppertinoDialog
class MyDialog extends StatelessWidget {
  /// Creates an iOS-style dialog.
  const MyDialog({
    Key key,
    this.child,
  }) : super(key: key);

  /// The widget below this widget in the tree.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 32,
        child: MyPopupSurface(
          child: child,
        ),
      ),
    );
  }
}

class MyPopupSurface extends StatelessWidget {
  /// Creates an iOS-style rounded rectangle popup surface.
  const MyPopupSurface({
    Key key,
    this.isSurfacePainted = true,
    this.child,
  }) : super(key: key);

  /// Whether or not to paint a translucent white on top of this surface's
  /// blurred background. [isSurfacePainted] should be true for a typical popup
  /// that contains content without any dividers. A popup that requires dividers
  /// should set [isSurfacePainted] to false and then paint its own surface area.
  ///
  /// Some popups, like iOS's volume control popup, choose to render a blurred
  /// area without any white paint covering it. To achieve this effect,
  /// [isSurfacePainted] should be set to false.
  final bool isSurfacePainted;

  /// The widget below this widget in the tree.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 40, sigmaY: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            backgroundBlendMode: BlendMode.overlay,
          ),
          child: Container(
            color: isSurfacePainted ? Colors.white : null,
            child: child,
          ),
        ),
      ),
    );
  }
}

///
