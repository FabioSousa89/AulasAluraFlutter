import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BytebankApp());  
    //findAll().then((contacts) => print(contacts.toString()));  
}

// ThemeData(
//         primaryColor: Colors.green[900],
//         accentColor: Colors.blueAccent[700],
//         buttonTheme: ButtonThemeData(
//           buttonColor: Colors.blueAccent[700],
//           textTheme: ButtonTextTheme.primary,
//         )
//       ),

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.blueAccent, // Your accent color
        ),
        buttonColor: Colors.blueAccent,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard(),
    );
  }
}


// class Dashboard extends StatelessWidget {
//   const Dashboard({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Dashboard'),
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [      
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Image.asset('images/bytebank_logo.png'),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(                              
//                 padding: EdgeInsets.all(8),
//                 height:100,
//                 width: 150,
//                 color: Theme.of(context).primaryColor,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Icon(Icons.people, color: Colors.white, size: 24,),
//                     Text('Contacts', style: TextStyle(color: Colors.white, fontSize: 16),)
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//   }
// }
