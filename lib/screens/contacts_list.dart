import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/contact_form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: [],
        future: Future.delayed(Duration(seconds: 1)).then((value) => findAll()),
        builder: (context, snapshot){
          final List<Contact> contacts = (snapshot.data as List<Contact>);

          return ListView.builder(
            itemBuilder: (context, index){
              final Contact contact = contacts[index];
              return _ContactItem(contact);
            },
            itemCount: contacts.length,        
          );

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [              
                CircularProgressIndicator(),
                Text('Loanding'),
              ],
            ),
          );
          

        },

      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactForm()))
            .then((newContact) => print(newContact.toString()));
        },
        child: Icon(
          Icons.add
        ),
      ),
    );
  }

  
}

class _ContactItem extends StatelessWidget {

  final Contact contact;

  const _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
          child: ListTile(
            title: Text(contact.name, style: TextStyle(fontSize: 24),),
            subtitle: Text(contact.accountNumber.toString(), style: TextStyle(fontSize: 16),),
          ),
        );
  }
}