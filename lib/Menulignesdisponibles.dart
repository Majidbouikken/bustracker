import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projet_2cp_g5/main.dart';

class MesLignes extends StatefulWidget {
  @override
  _MesLignesState createState() => _MesLignesState();
}

class _MesLignesState extends State<MesLignes> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        body: new CustomScrollView(
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
            "Lignes disponibles",
            style: Theme.of(context).textTheme.title,
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 138,
                    decoration: BoxDecoration(
                      color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        boxShadow: [
                          //TODO: add this shadow color to the main as color variable
                          new BoxShadow(
                              color: Color.fromARGB(10, 0, 0, 0),
                              blurRadius: 10),
                          new BoxShadow(
                              color: Color.fromARGB(33, 0, 0, 0),
                              offset: Offset(0, 10),
                              blurRadius: 10),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Ligne 1',
                                style: TextStyle(
                                    color: Colors.red, fontSize: 15),
                              ),
                              Expanded(child: SizedBox()),
                              Text('13,1km'),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text('  Ben aknoun'),
                              Text('  Cheraga')
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 138,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        boxShadow: [
                          //TODO: add this shadow color to the main as color variable
                          new BoxShadow(
                              color: Color.fromARGB(10, 0, 0, 0),
                              blurRadius: 10),
                          new BoxShadow(
                              color: Color.fromARGB(33, 0, 0, 0),
                              offset: Offset(0, 10),
                              blurRadius: 10),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Ligne 1',
                                style: TextStyle(
                                    color: Colors.red, fontSize: 15),
                              ),
                              Expanded(child: SizedBox()),
                              Text('13,1km'),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text('  Ben aknoun'),
                              Text('  Cheraga')
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 138,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        boxShadow: [
                          //TODO: add this shadow color to the main as color variable
                          new BoxShadow(
                              color: Color.fromARGB(10, 0, 0, 0),
                              blurRadius: 10),
                          new BoxShadow(
                              color: Color.fromARGB(33, 0, 0, 0),
                              offset: Offset(0, 10),
                              blurRadius: 10),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Ligne 1',
                                style: TextStyle(
                                    color: Colors.red, fontSize: 15),
                              ),
                              Expanded(child: SizedBox()),
                              Text('13,1km'),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text('  Ben aknoun'),
                              Text('  Cheraga')
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 138,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        boxShadow: [
                          //TODO: add this shadow color to the main as color variable
                          new BoxShadow(
                              color: Color.fromARGB(10, 0, 0, 0),
                              blurRadius: 10),
                          new BoxShadow(
                              color: Color.fromARGB(33, 0, 0, 0),
                              offset: Offset(0, 10),
                              blurRadius: 10),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Ligne 1',
                                style: TextStyle(
                                    color: Colors.red, fontSize: 15),
                              ),
                              Expanded(child: SizedBox()),
                              Text('13,1km'),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text('  Ben aknoun'),
                              Text('  Cheraga')
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 138,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        boxShadow: [
                          //TODO: add this shadow color to the main as color variable
                          new BoxShadow(
                              color: Color.fromARGB(10, 0, 0, 0),
                              blurRadius: 10),
                          new BoxShadow(
                              color: Color.fromARGB(33, 0, 0, 0),
                              offset: Offset(0, 10),
                              blurRadius: 10),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Ligne 1',
                                style: TextStyle(
                                    color: Colors.red, fontSize: 15),
                              ),
                              Expanded(child: SizedBox()),
                              Text('13,1km'),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text('  Ben aknoun'),
                              Text('  Cheraga')
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 138,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        boxShadow: [
                          //TODO: add this shadow color to the main as color variable
                          new BoxShadow(
                              color: Color.fromARGB(10, 0, 0, 0),
                              blurRadius: 10),
                          new BoxShadow(
                              color: Color.fromARGB(33, 0, 0, 0),
                              offset: Offset(0, 10),
                              blurRadius: 10),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Ligne 1',
                                style: TextStyle(
                                    color: Colors.red, fontSize: 15),
                              ),
                              Expanded(child: SizedBox()),
                              Text('13,1km'),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text('  Ben aknoun'),
                              Text('  Cheraga')
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  )
                ],
              )),

          //
        ])),
      ],
    ));
  }
}
