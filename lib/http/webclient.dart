
import 'dart:convert';

import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

Future<List<Transaction>> findAll()  async {
    
    Client client =    InterceptedClient.build(
      interceptors: [LoggingInterceptor()]
    );

    final Response response = await client.get(Uri.parse("http://192.168.86.22:8080/transactions")).timeout(Duration(seconds: 5));

    final List<dynamic> decodedJson = jsonDecode(response.body);

    final List<Transaction> transactions = [];
    for(Map<String, dynamic> e in decodedJson){
      final Map<String, dynamic> contactJson = e['contact'];
      final Transaction transaction = Transaction(
        e['value'], 
        Contact(
          0, 
          contactJson['name'], 
          contactJson['accountNumber']
        )
      );
      transactions.add(transaction);
    }

    return transactions;
    
}

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    
    print('url ${data.url}');
    print('headers ${data.headers}');
    print('body ${data.body}');   
    
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {

    print('Response');
    print('status code ${data.statusCode}');
    print('headers ${data.headers}');
    print('body ${data.body}');   


    return data;
  }

}