import 'package:flutter/material.dart';
import 'package:projet_2cp_g5/main.dart';

class LogInPage extends StatefulWidget {
  @override
  State createState() => new LogInPageState();
}

class LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
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
                  child: TextField(
                    style: TextStyle(fontSize: 24, color: Colors.black87),
                    decoration: InputDecoration(prefixIcon: Icon(Icons.verified_user),border: InputBorder.none),
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
                    style: TextStyle(fontSize: 24, color: Colors.black87),
                    decoration: InputDecoration(prefixIcon: Icon(Icons.verified_user),border: InputBorder.none),
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
                      analogousMagenta,
                      mainRed,
                      analogousOrange,
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
                    onPressed: main,
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
                            "facebook",
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
            ],
          ),
        ),
      ),
    );
  }
}
