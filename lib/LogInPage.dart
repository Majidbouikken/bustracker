import 'package:flutter/material.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class LogInPage extends StatefulWidget {

  @override
  State createState() {
    return new LogInPageState();
  }
}

class LogInPageState extends State<LogInPage> {

  String _email,_password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //Google Sign in

  GoogleSignIn googleAuth = new GoogleSignIn();

  //Facebook Sign in

  FacebookLogin fblogin = new FacebookLogin();

  bool validateAndSave(){
  final form = formKey.currentState;
  if (form.validate()){
    form.save();
    return true;
  }
    return false;
  }

  void validateAndSubmit() async {

    CircularProgressIndicator();
    if (validateAndSave()){

      try{

        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _email,
            password: _password);

        // Retrieving User's DATA
        User.setAdresseMail(user.email);
        User.setID(user.uid);

        var Nom = await Firestore.instance.collection('users').where('User_ID',isEqualTo: user.uid).getDocuments();
        String nom = Nom.documents[0].data['Nom'];
        User.setNom(nom);

        var Prenom = await Firestore.instance.collection('users').where('User_ID',isEqualTo: user.uid).getDocuments();
        String prenom = Prenom.documents[0].data['Prenom'];
        User.setPrenom(prenom);

        var Numtel = await Firestore.instance.collection('users').where('User_ID',isEqualTo: user.uid).getDocuments();
        String numero = Numtel.documents[0].data['NumTel'];
        User.setNumTel(numero);

        var Rayon = await Firestore.instance.collection('users').where('User_ID', isEqualTo: user.uid).getDocuments();
        double rayon = Rayon.documents[0].data['RayonActuel'];
        User.setRayon(rayon);

        var DocRef = await Firestore.instance.collection('users').where('User_ID', isEqualTo: user.uid).getDocuments();
        String docref = DocRef.documents[0].data['DocID'];
        User.setDocID(docref);

        var Pass = await Firestore.instance.collection('users').where('User_ID', isEqualTo: user.uid).getDocuments();
        String password = Pass.documents[0].data['Password'];
        User.setPass(password);

        Navigator.of(context)
            .pushReplacementNamed("/HomePage");
      }
      catch(e){
        print('Error: $e');
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Form(
            key: formKey,
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Connexion",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontSize: 28),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: 1080,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey[200],
              ),
              child: Center(
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator : (value) {
                    Pattern pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regex = new RegExp(pattern);
                    if (!regex.hasMatch(value))
                      return 'Entrez une adresse valide!';
                    else
                      return null;
                  },
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                  decoration: InputDecoration(prefixIcon: Icon(Icons.account_circle),border: InputBorder.none),
                  onSaved: (input){
                    setState(() {
                      _email=input;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Container(
              width: 1080,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey[200],
              ),
              child: Center(
                child: TextFormField(
                  validator : (value)  {
                    if (value.length < 6)
                      return 'Mot de passe incorrecte';
                    else
                      return null;
                  },
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                  obscureText: true,
                  decoration: InputDecoration(prefixIcon: Icon(Icons.verified_user),border: InputBorder.none),
                  onSaved: (input){
                   setState(() {
                     _password=input;
                   });
                  },
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: 1080,
              height: 52,
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
                      color: Color(0xCCf95149),
                      offset: Offset(0, 3),
                      blurRadius: 10)
                ],
              ),
              child: FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onPressed:  validateAndSubmit,
                  child: Text(
                    "SE CONNECTER",
                    style: new TextStyle(
                        color: Colors.white,
                        fontFamily: 'Oxygen',
                        fontSize: 16),
                  )),
            ),
            SizedBox(
              height: 52,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: ColorsSocial.facebook,
                      boxShadow: [
                        BoxShadow(
                            color: ColorsSocial.facebook,
                            offset: Offset(0, 3),
                            blurRadius: 10)
                      ],
                    ),
                    child: FlatButton(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onPressed: (){
                           fblogin.logInWithReadPermissions(['email','public_profile'])
                              .then((result){
                                switch (result.status){
                                  case FacebookLoginStatus.loggedIn:
                                    print('EEEEEEEEE');
                                    FirebaseAuth.instance.signInWithFacebook(
                                        accessToken: result.accessToken.token,
                                    )
                            .then((signedInUser){
                                      User.setNom(signedInUser.displayName);
                                      User.setPrenom('');
                                      User.setNumTel('');
                                      User.setAdresseMail(signedInUser.email);
                                      User.setRayon(300.0);
                                      User.setID('');
                                      User.setDocID('');
                                      Navigator.of(context).pushReplacementNamed('/HomePage');
                                    }).catchError((e){
                                      print(e);
                                    }); break;
                                  case FacebookLoginStatus.cancelledByUser:
                                  debugPrint("Facebook Login Canceled!");
                                      break;
                                    case FacebookLoginStatus.error:
                                      debugPrint("Facebook Login Error!" + result.toString());
                                      break;
                                    }
                              })
                              .catchError((e){
                            print(e);
                          });
                        },
                        child: Text(
                          "Facebook",
                          style: new TextStyle(
                              color: Colors.white,
                              fontFamily: 'Oxygen',
                              fontSize: 16),
                        )),
                  ),
                ),
                SizedBox(width: 16,),
                Expanded(
                  child: Container(
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(30, 0, 0, 0),
                            offset: Offset(0, 3),
                            blurRadius: 10)
                      ],
                    ),
                    child: FlatButton(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onPressed: (){
                          googleAuth.signIn().then((result){
                            result.authentication.then((googleKey){
                            FirebaseAuth.instance.signInWithGoogle(
                                idToken: googleKey.idToken,
                                accessToken: googleKey.accessToken
                            ).then((signedInUser){
                                User.setNom(signedInUser.displayName);
                                User.setPrenom('');
                                User.setNumTel('');
                                User.setAdresseMail(signedInUser.email);
                                User.setRayon(300.0);
                                User.setID('');
                                User.setDocID('');
                                Navigator.of(context).pushReplacementNamed('/HomePage');
                            }).catchError((e){
                              print(e);
                            });
                            }).catchError((e){
                              print(e);
                            });
                          }).catchError((e){
                            print(e);
                          });
                        },
                        child: Text(
                          "Google",
                          style: new TextStyle(
                              color: Colors.black87,
                              fontFamily: 'Oxygen',
                              fontSize: 16),
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                    child: Text("Inscrivez-vous", style: TextStyle(
                        color: mainRed, fontFamily: 'Montserrat', fontSize: 11, fontStyle: FontStyle.italic)),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed("/SignUpPage");
                    }
                ),
                Text("  ou  ", style: TextStyle(
                    color: mediumGrey, fontFamily: 'Montserrat', fontSize: 11),),
                GestureDetector(
                    child: Text("mot de passe oublié?", style: TextStyle(
                        color: mainRed, fontFamily: 'Montserrat', fontSize: 11),),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed("/SignUpPage");
                    }
                ),
              ],
            )
          ],
            ),
        ),
      ),

    );
  }

}
