import 'package:flutter/material.dart';
import 'package:glucose_control/clock_follow/home_page.dart';
import 'package:glucose_control/login/login.dart';

import '../../const.dart';
import '../../login/login_intro.dart';

class Route2 extends StatefulWidget {
  @override
  _Route2State createState() => _Route2State();
}

class _Route2State extends State<Route2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(top: 20),
      child: Builder(builder: (context) {
        return ListView(
          children: [
            buildItem(
              Icon(Icons.file_copy, color: Colors.green),
              LoginTexts.titleItem8,
              Icon(Icons.add_task),
            ),
            buildItem(Icon(Icons.file_copy, color: Colors.green),
                LoginTexts.titleItem9, Icon(Icons.add_task)),
            buildItem(Icon(Icons.file_copy, color: Colors.green),
                LoginTexts.tilteItem10, Icon(Icons.add_task)),
            Container(
              margin: EdgeInsets.only(left: 80, top: 20, right: 80),
              child: RaisedButton(
                child: Text(
                  'Next',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));

                  //Send to API
                },
              ),
            )
            // Expanded(child: child)
          ],
        );
      }),
    ));
  }
}

Widget buildItem(Icon leadingicon, String title, Icon trailingicon) {
  return Container(
    margin: EdgeInsets.only(left: 20, top: 20, right: 20),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.green, style: BorderStyle.solid),
      borderRadius: BorderRadius.circular(7.0),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: leadingicon,
        trailing: trailingicon,
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onTap: () {},
      ),
    ),
  );
}
