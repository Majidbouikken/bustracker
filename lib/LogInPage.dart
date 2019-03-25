import 'package:flutter/material.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class LogInPage extends StatefulWidget {

  @override
  State createState() {
    return new LogInPageState();
  }
}

class LogInPageState extends State<LogInPage> {

  String _email,_password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool validateAndSave(){
  final form = formKey.currentState;
  if (form.validate()){
    form.save();
    return true;
  }
    return false;
  }

  void validateAndSubmit() async {
    if (validateAndSave()){
      try{
        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _email,
            password: _password);
        User.setAdresseMail(user.email);
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
                color: lightGrey,
              ),
              child: Center(
                child: TextFormField(
                  validator : (value) => value.isEmpty ? 'Adresse vide ou incorrecte' : null,
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
                color: lightGrey,
              ),
              child: Center(
                child: TextFormField(
                  validator : (value) => value.isEmpty ? 'Mot de passe vide ou incorrecte' : null,
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
                        onPressed: main,
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
                        onPressed: main,
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
