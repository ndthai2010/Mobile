import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../form_infor/form_doctor.dart';
import '../regimen/routetpn/route1.dart';
import 'mainscreen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String myEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        actions: [
          FlatButton.icon(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainScreen()));
              },
              icon: Icon(
                Icons.person_outline,
                color: Colors.white,
              ),
              label: Text(
                'Log out',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ))
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: _fetch(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done)
              return Text("Loading data...Please wait");
            return Column(
              children: [
                Text(
                  "Email : $myEmail",
                  style: TextStyle(color: Colors.blue, fontSize: 24),
                ),
                RaisedButton(
                    child: Text(
                      'Điền thông tin bệnh nhân',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FormScreen()));

                      //Send to API
                    })
              ],
            );
          },
        ),
      ),
    );
  }

  _fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser!;
    if (firebaseUser != null)
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        myEmail = ds.data()!['email'];
        print(myEmail);
      }).catchError((e) {
        print(e);
      });
  }
}
