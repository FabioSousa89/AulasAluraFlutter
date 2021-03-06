import 'package:bytebank/models/saldo.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:bytebank/screens/dashboard/saldo.dart';
import 'package:bytebank/screens/deposito/formulario.dart';
import 'package:bytebank/screens/transaction_form.dart';
import 'package:bytebank/screens/transactions_list.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:bytebank/screens/transferencia/lista-transferencia.dart';
import 'package:bytebank/screens/transferencia/ultimas-transferencias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bytebank'),
      ),
      body: ListView(
        children: [
            Align(
            alignment: Alignment.topCenter,
            child: SaldoCard(),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(                
                child: Text('Receber depósito'),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context){
                      return FormularioDeposito();
                    })
                  );
                },
              ),
              ElevatedButton(
                onPressed:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context){
                      return FormularioTransferencia();
                    })
                  );
                } , 
                child: Text('Nova transferência'),
              ),
            ],
          ),
          UltimasTransferencias(),
        ],
      )
    );
  }
}




















// import 'package:bytebank/screens/transactions_list.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:flutter/material.dart';
// import 'package:path/path.dart';

// import 'package:bytebank/screens/contacts_list.dart';
// import 'package:sqflite/sqlite_api.dart';

// class Dashboard extends StatefulWidget {
//   const Dashboard({ Key? key }) : super(key: key);

//   @override
//   State<Dashboard> createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
  

//   void _showContactsList(BuildContext context) {

   
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => ContactsList(),
//       ),
//     );
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Dashboard'),
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [      
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Image.asset('images/bytebank_logo.png'),
//             ),
//             Container(
//             height: 120,
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               children: [
//                 _FeatureItem(
//                   'Transfer',
//                   Icons.monetization_on,
//                   onClick: () {
//                     _showContactsList(context);
//                   },
//                 ),
//                 _FeatureItem(
//                   'Transaction Feed',
//                   Icons.description,
//                   onClick: () => _showTransactionsList(context),
//                 ),
//               ],
//             ),
//           ),
//           ],
//         ),
//       );
//   }

//   _showTransactionsList(BuildContext context) {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => TransactionsList(),
//         ),
//     );    
//   } 
// }

// class _FeatureItem extends StatelessWidget {

//   final String name;
//   final IconData icon;
//   final Function onClick;

//   const _FeatureItem(this.name, this.icon, {required this.onClick});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Material(
//         color: Theme.of(context).primaryColor,
//         child: InkWell(                  
//           onTap: () => onClick(),
//           child: Container(                              
//             padding: const EdgeInsets.all(8),
//             height:100,
//             width: 150,                    
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Icon(icon, color: Colors.white, size: 24,),
//                 Text(name, style: TextStyle(color: Colors.white, fontSize: 16),)
//               ],
//             ),

//           ),
//         ),
//       ),
//     );
//   }
// }
