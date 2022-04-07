import 'package:flutter/material.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New contact'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(          
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Full name',              
              ),
              style: TextStyle(fontSize: 24),
            ),
      
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Account number',              
                ),
                style: TextStyle(fontSize: 24),
                keyboardType: TextInputType.number,
              ),
            ),
      
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: (){}, 
                  child: Text('Create')
                ),
              ),
            )
      
          ]
        ),
      ),
    );
  }
}