import 'package:bytebankv2/models/contact.dart';
import 'package:bytebankv2/screens/contact_form.dart';
import 'package:bytebankv2/screens/dashboard.dart';
import 'package:flutter/material.dart';

import 'database/app_database.dart';

void main() {
  runApp(BytebankApp());
  save(Contact(0, 'eu', 1000)).then((id){
    findAll().then((contacts) => debugPrint(contacts.toString()));
  });
}
class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard(),
    );
  }
}
