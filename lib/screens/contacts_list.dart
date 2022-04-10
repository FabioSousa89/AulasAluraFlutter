import 'package:bytebank/screens/contact_form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text('Alex', style: TextStyle(fontSize: 24),),
              subtitle: Text('1000', style: TextStyle(fontSize: 16),),
            ),
          )
        ],
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