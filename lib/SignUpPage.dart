import 'package:flutter/material.dart';
import 'package:projet_2cp_g5/main.dart';

class SignUpPagePage extends StatefulWidget {
  @override
  State createState() => new SignUpPageState();
}

///i tried to implement a stepper in the Sign Up Page for a good looking page

class SignUpPageState extends State<SignUpPagePage> {
  /*
  int current_step = 0;

  List<Step> my_steps = [
    new Step(
      // Title of the Step
        title: new Text("Add your name and email"),
        // Content, it can be any widget here. Using basic Text for this example
        content: new Column(
          children: <Widget>[
            Container(
              width: 1080,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: lightGrey,
              ),
              child: Center(
                child: TextField(
                  style: TextStyle(fontSize: 24, color: Colors.black87),
                  decoration: InputDecoration(prefixIcon: Icon(Icons.verified_user),border: InputBorder.none),
                ),
              ),
            ),
            Container(
              width: 1080,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: lightGrey,
              ),
              child: Center(
                child: TextField(
                  style: TextStyle(fontSize: 24, color: Colors.black87),
                  decoration: InputDecoration(prefixIcon: Icon(Icons.verified_user),border: InputBorder.none),
                ),
              ),
            ),
          ],
        ),
        isActive: true),
    new Step(
        title: new Text("Step 2"),
        content: new Text("World!"),
        // You can change the style of the step icon i.e number, editing, etc.
        state: StepState.editing,
        isActive: true),
    new Step(
        title: new Text("Step 3"),
        content: new Text("Hello World!"),
        isActive: true),
  ];
*/
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // Body
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Inscription",
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
                child: TextField(
                  onChanged: (String value) {
                    User.setPrenom(value);
                  },
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle),
                    border: InputBorder.none,
                    hintText: "Prénom",
                    hintStyle: Theme.of(context).textTheme.display2,
                  ),
                ),
              ),
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
                child: TextField(
                  onChanged: (String value) {
                    User.setNom(value);
                  },
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle),
                    border: InputBorder.none,
                    hintText: "Nom",
                    hintStyle: Theme.of(context).textTheme.display2,
                  ),
                ),
              ),
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
                child: TextField(
                  onChanged: (String value) {
                    User.setAdresseMail(value);
                  },
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    border: InputBorder.none,
                    hintText: "Adresse mail",
                    hintStyle: Theme.of(context).textTheme.display2,
                  ),
                ),
              ),
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
                child: TextField(
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.verified_user),
                    border: InputBorder.none,
                    hintText: "Mot de passe",
                    hintStyle: Theme.of(context).textTheme.display2,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
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
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("/HomePage");
                  },
                  child: Text(
                    "S'INSCRIRE",
                    style: new TextStyle(
                        color: Colors.white,
                        fontFamily: 'Oxygen',
                        fontSize: 16),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
