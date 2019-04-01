import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserManagement {
  void getdata(String uid) async {
    // Retrieving User's DATA
    var Nom = await Firestore.instance
        .collection('users')
        .where('User_ID', isEqualTo: uid)
        .getDocuments();
    String nom = Nom.documents[0].data['Nom'];
    User.setNom(nom);

    var Prenom = await Firestore.instance
        .collection('users')
        .where('User_ID', isEqualTo: uid)
        .getDocuments();
    String prenom = Prenom.documents[0].data['Prenom'];
    User.setPrenom(prenom);

    var Numtel = await Firestore.instance
        .collection('users')
        .where('User_ID', isEqualTo: uid)
        .getDocuments();
    String numero = Numtel.documents[0].data['NumTel'];
    User.setNumTel(numero);

    var Rayon = await Firestore.instance
        .collection('users')
        .where('User_ID', isEqualTo: uid)
        .getDocuments();
    double rayon = Rayon.documents[0].data['RayonActuel'];
    User.setRayon(rayon);

  }

  Future storeNewUser(user, context) async {
    String temp;
    User.setAdresseMail(user.email);
    User.setID(user.uid);
    final docRef = await Firestore.instance.collection('/users').add({
      'Email': user.email,
      'User_ID': user.uid,
      'NumTel': User.getNumTel(),
      'Nom': User.getNom(),
      'Prenom': User.getPrenom(),
      'RayonActuel': 300.0,
      'DocID' : '',
      'Password' : User.getPass()
    });
      User.setDocID(docRef.documentID);
      Firestore.instance
        .collection("users")
        .document(docRef.documentID)
        .updateData({'DocID': docRef.documentID}).catchError((e) {
      print(e);
      });
      temp = User.getID();
      getdata(temp);
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed('/HomePage');

  }

  void updateRayon(String selectedDoc, double ray) async {
    Firestore.instance
        .collection("users")
        .document(selectedDoc)
        .updateData({'RayonActuel': ray}).catchError((e) {
      print(e);
    });
  }

  void updateMail(String selectedDoc,String OldMail ,String Newmail,String password) async {
    Firestore.instance
        .collection("users")
        .document(selectedDoc)
        .updateData({'Email': Newmail}).catchError((e) {
      print(e);
    });
    FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: OldMail,
        password: password);
    user.updateEmail(Newmail);

  }

  void updateNumTel(String selectedDoc, String num) async {
    Firestore.instance
        .collection("users")
        .document(selectedDoc)
        .updateData({'NumTel': num}).catchError((e) {
      print(e);
    });
  }

  void updateNom(String selectedDoc, String nom) async {
    Firestore.instance
        .collection("users")
        .document(selectedDoc)
        .updateData({'Nom': nom}).catchError((e) {
      print(e);
    });
  }

  void updatePrenom(String selectedDoc, String prenom) async {
    Firestore.instance
        .collection("users")
        .document(selectedDoc)
        .updateData({'Prenom': prenom}).catchError((e) {
      print(e);
    });
  }

  void updatePass(String selectedDoc,String email ,String NewPass,String OldPass) async {
    Firestore.instance
        .collection("users")
        .document(selectedDoc)
        .updateData({'Password': NewPass}).catchError((e) {
      print(e);
    });
    FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: OldPass);
    user.updatePassword(NewPass);

  }

}
