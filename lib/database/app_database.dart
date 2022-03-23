import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/contact.dart';

Future<Database> createDatabase() async{
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(path, onCreate: (db, version){
      db.execute(
        'CREATE TABLE contacts('
        'id INTEGER PRIMARY KEY, '
        'name text, '
        'number INTEGER)'
      );
    }, version: 1);
  // return getDatabasesPath().then((dbPath){
  //   final String path = join(dbPath, 'bytebank.db');
  //   return openDatabase(path, onCreate: (db, version){
  //     db.execute(
  //       'CREATE TABLE contacts('
  //       'id INTEGER PRIMARY KEY, '
  //       'name text, '
  //       'number INTEGER)'
  //     );
  //   }, 
  //     version: 2,
  //     onDowngrade: onDatabaseDowngradeDelete,
  //   );
  // },);
}

Future<int> save(Contact contact){
  return createDatabase().then((db){
    final Map<String, dynamic> contactMap = Map();

    contactMap['id'] = contact.id;
    contactMap['name'] = contact.name;
    contactMap['number'] = contact.number;

    return db.insert('contacts', contactMap);
  });
}

Future<List<Contact>> findAll() async{
  final List<Contact> contacts = [];
  final db = await createDatabase();

    return db.query('contacts').then((maps) {
      for(Map<String, dynamic> map in maps){
        final Contact contact = Contact(
          map['id'],
          map['name'],
          map['number'],
        );
      contacts.add(contact);
      }
        return contacts;
    });
}