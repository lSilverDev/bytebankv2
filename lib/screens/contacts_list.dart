import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class contactList extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Contracts'), 
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text(
                'Alex',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              subtitle: Text(
                '1000',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}