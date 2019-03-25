import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'main.dart';

class UserManagement {
  storeNewUser(user, context){
    User.setAdresseMail(user.email);
    Firestore.instance.collection('/users').add({
      'Email': user.email,
      'User_ID': user.uid,
      'NumTel': User.getNumTel(),
      'Nom' : User.getNom(),
      'Prenom': User.getPrenom(),
    }).then((value){
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacementNamed('/HomePage');
    }).catchError((e){
      print(e);
    });
  }

}