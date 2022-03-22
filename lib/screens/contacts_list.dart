import 'package:bytebankv2/screens/contact_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../database/app_database.dart';
import '../models/contact.dart';

class contactList extends StatelessWidget{
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Contracts'), 
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: [],
        future: Future.delayed(Duration(seconds: 1)).then((value) => findAll()),
          builder: (context, snapshot) {
            final List<Contact>? contacts = snapshot.data;
            if(contacts != null){
                return  ListView.builder(
                  itemBuilder: (context, index) {
                    final Contact contact = contacts[index];
                    return _ContactItem(contact);
                  },
                  itemCount: contacts.length,
                );
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Text('Loading...'),
                ],
              ),
            );
          },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ContactForm()
          )
        ).then(
          (newContact) => debugPrint(newContact.toString())
        ),
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget{
  
  final Contact contact;

  _ContactItem(this.contact);

  @override
  Widget build(BuildContext context){
    return Card(
            child: ListTile(
              title: Text(
                contact.name,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              subtitle: Text(
                contact.number.toString(),
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          );
  }
}